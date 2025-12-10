import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:poker_tactics/services/assets.dart';
import 'player_slot.dart';

/// A draggable card component implemented with Flame's Drag callbacks.
/// Displays a sprite image instead of drawn graphics.
class CardComponent extends SpriteComponent
    with DragCallbacks, HasGameReference<FlameGame> {
  final String rank;
  final String suit;

  CardComponent({this.rank = 'a', this.suit = 'bich'})
    : super(anchor: Anchor.topLeft);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = Vector2(62, 86);
    // Load sprite from Assets based on rank and suit
    sprite = await game.loadSprite(
      Assets.getCardAsset(rank, suit),
      srcSize: size,
    );
  }

  bool isDragging = false;
  double elevation = 0; // 0 = bình thường, 1 = nâng cao
  double elevationTarget = 0; // giá trị muốn tiến tới
  double frameTime = 1 / 24; // 24 FPS
  double accumulator = 0;

  final List<Offset> trail = [];
  final int maxTrail = 6; // số "bóng" mờ

  Vector2? moveTarget;
  double moveSpeed = 40; // chỉnh tùy ý

  Vector2? originalPosition;

  @override
  void update(double dt) {
    super.update(dt);
    accumulator += dt;

    if (accumulator < frameTime) return;
    accumulator -= frameTime;

    // cập nhật elevation theo step (không mượt)
    const step = 0.25;
    if (elevation < elevationTarget) {
      elevation = (elevation + step).clamp(0, 1);
    } else if (elevation > elevationTarget) {
      elevation = (elevation - step).clamp(0, 1);
    }

    // chỉ lưu vết khi đang drag
    if (isDragging) {
      trail.add(position.clone().toOffset());

      // giữ list không quá dài
      if (trail.length > maxTrail) {
        trail.removeAt(0);
      }
    } else {
      // không kéo nữa thì fade dần vết
      if (trail.isNotEmpty) trail.removeAt(0);
    }

    if (moveTarget != null) {
      // Lerp dần
      position = Vector2(
        lerpDouble(position.x, moveTarget!.x, dt * moveSpeed)!,
        lerpDouble(position.y, moveTarget!.y, dt * moveSpeed)!,
      );

      // Nếu đủ gần thì snap lại
      if ((position - moveTarget!).length < 0.5) {
        position = moveTarget!;
        moveTarget = null;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    if (elevation > 0) {
      double shadowOffset = elevation * 6;
      // Vẽ shadow trước
      final shadowPaint = Paint()
        ..color = Colors.black.withOpacity(0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 0); // nhẹ thôi

      // Render shadows
      final rect1 = Rect.fromLTWH(0, 0, size.x - 4, 1);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect1, shadowPaint);
      canvas.restore();

      final rect2 = Rect.fromLTWH(0, 1, size.x - 2, 1);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect2, shadowPaint);
      canvas.restore();

      final rect3 = Rect.fromLTWH(0, 2, size.x - 1, 2);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect3, shadowPaint);
      canvas.restore();

      final rect4 = Rect.fromLTWH(0, 4, size.x, size.y - 8);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect4, shadowPaint);
      canvas.restore();

      final rect5 = Rect.fromLTWH(1, size.y - 4, size.x - 2, 2);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect5, shadowPaint);
      canvas.restore();

      final rect6 = Rect.fromLTWH(2, size.y - 2, size.x - 4, 1);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect6, shadowPaint);
      canvas.restore();

      final rect7 = Rect.fromLTWH(4, size.y - 1, size.x - 8, 1);
      canvas.save();
      canvas.translate(
        shadowOffset,
        shadowOffset,
      ); // lệch chút cho giống shadow
      canvas.drawRect(rect7, shadowPaint);
      canvas.restore();
    }
    // vẽ các bóng mờ trước
    for (int i = 0; i < trail.length; i++) {
      final t = i / trail.length; // từ 0 → 1

      final paint = Paint()..color = Colors.white.withOpacity((1 - t) * 0.15);
      // hoặc Colors.black.withOpacity((1 - t) * 0.2);

      canvas.save();
      canvas.translate(
        (trail[i].dx - position.x) * 0.025,
        (trail[i].dy - position.y) * 0.025 - elevation * 2,
      );

      sprite?.render(canvas, size: size, overridePaint: paint);

      canvas.restore();
    }

    // Vẽ card thật lên trên
    if (elevation > 0) {
      canvas.save();
      canvas.translate(0, -elevation * 2); // nâng lên theo elevation
      super.render(canvas);
      // canvas.restore();
    } else {
      super.render(canvas);
    }
  }

  @override
  void onDragStart(DragStartEvent info) {
    super.onDragStart(info);
    isDragging = true;
    elevationTarget = 1; // bắt đầu nâng lên
    moveTarget = null;
    // raise priority so the card renders on top while dragging
    // lưu lại vị trí cũ
    originalPosition = position.clone();
    priority = 1000;
  }

  @override
  void onDragUpdate(DragUpdateEvent info) {
    // move by the drag delta (game coordinates)
    position.add(info.canvasDelta);
  }

  @override
  void onDragEnd(DragEndEvent info) {
    super.onDragEnd(info);

    isDragging = false;
    elevationTarget = 0;

    final slots = game.children.whereType<PlayerSlot>().toList();
    final cardCenter = absolutePosition + size / 2;

    for (final slot in slots) {
      final slotPos = slot.absolutePosition;
      final slotRect = Rect.fromLTWH(
        slotPos.x,
        slotPos.y,
        slot.size.x,
        slot.size.y,
      );

      if (slotRect.contains(Offset(cardCenter.x, cardCenter.y))) {
        // => Đặt target position, KHÔNG đặt position trực tiếp
        moveTarget = Vector2(
          slot.position.x + (slot.size.x - size.x) / 2,
          slot.position.y + (slot.size.y - size.y) / 2,
        );
        slot.occupied = true;
        priority = 0;
        return;
      }
    }
    // không vào slot nào cả, trả về vị trí cũ
    moveTarget = originalPosition;
    priority = 0;
  }
}
