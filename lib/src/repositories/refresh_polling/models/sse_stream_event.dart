/// SSE stream event with optional type and raw payload.
class SseStreamEvent {
  /// Creates a new stream event.
  const SseStreamEvent({required this.event, required this.data});

  /// Event name (e.g., uuid, update, keep-alive).
  final String event;

  /// Raw event payload.
  final String data;
}
