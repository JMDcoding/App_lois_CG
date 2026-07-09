import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';

/// Ã‰cran de chat avec l'assistant juridique IA
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final List<_ChatMessage> _messages = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    // Message de bienvenue
    _messages.add(_ChatMessage(
      text: 'Bonjour ! ðŸ‘‹ Je suis votre assistant juridique Mobeko.\n\n'
          'Je peux vous aider à :\n'
          'â€¢ Comprendre vos droits\n'
          'â€¢ Expliquer les lois congolaises\n'
          'â€¢ Guider vos démarches\n'
          'â€¢ Générer des checklists\n\n'
          'Comment puis-je vous aider aujourd\'hui ?',
      isUser: false,
      timestamp: DateTime.now(),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.smart_toy_rounded,
                  color: AppColors.white, size: 20),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assistant Juridique',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.white : AppColors.darkGreen,
                  ),
                ),
                Text(
                  _isTyping ? 'En train d\'écrire...' : 'En ligne',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: _isTyping ? AppColors.lightGreen : AppColors.grey500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _clearChat,
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Nouvelle conversation',
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length && _isTyping) {
                  return _TypingIndicator(isDark: isDark);
                }
                return _MessageBubble(
                  message: _messages[index],
                  isDark: isDark,
                );
              },
            ),
          ),

          // Disclaimer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            color: isDark
                ? AppColors.darkCard.withValues(alpha: 0.5)
                : AppColors.paleGreen.withValues(alpha: 0.3),
            child: Text(
              'âš–ï¸ Informations à titre indicatif. Consultez un avocat pour un conseil personnalisé.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                color: AppColors.grey500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Input
          _ChatInput(
            controller: _controller,
            isDark: isDark,
            onSend: _sendMessage,
            onVoice: _startVoiceInput,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      _controller.clear();
      _isTyping = true;
    });

    _scrollToBottom();

    // Simuler une réponse IA (sera remplacé par l'appel Gemini API)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(_ChatMessage(
            text: _generateMockResponse(text),
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
        _scrollToBottom();
      }
    });
  }

  String _generateMockResponse(String query) {
    // Réponse mock - sera remplacée par Gemini API
    return 'ðŸ“‹ **Réponse à votre question :**\n\n'
        'Votre question concerne un sujet important du droit congolais. '
        'Voici les points essentiels à retenir :\n\n'
        '1. **Cadre juridique** : Selon la Constitution de la République du Congo '
        'et le Code civil, vos droits sont protégés.\n\n'
        '2. **Démarches recommandées** :\n'
        '   â€¢ Rassemblez les documents nécessaires\n'
        '   â€¢ Contactez l\'organisme compétent\n'
        '   â€¢ Respectez les délais légaux\n\n'
        '3. **Organismes compétents** :\n'
        '   â€¢ Tribunal de Grande Instance\n'
        '   â€¢ Préfecture de votre localité\n\n'
        'âš ï¸ *Cette réponse est fournie à titre informatif et ne remplace pas '
        'un conseil juridique personnalisé.*';
  }

  void _startVoiceInput() {
    // TODO: Implémenter la reconnaissance vocale
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reconnaissance vocale bientôt disponible')),
    );
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
      _messages.add(_ChatMessage(
        text: 'Bonjour ! ðŸ‘‹ Comment puis-je vous aider ?',
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  _ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class _MessageBubble extends StatelessWidget {
  final _ChatMessage message;
  final bool isDark;

  const _MessageBubble({required this.message, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 8, top: 4),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.smart_toy_rounded,
                  color: AppColors.white, size: 16),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: message.isUser
                    ? AppColors.forestGreen
                    : (isDark ? AppColors.darkCard : AppColors.grey100),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(message.isUser ? 16 : 4),
                  bottomRight: Radius.circular(message.isUser ? 4 : 16),
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  height: 1.5,
                  color: message.isUser
                      ? AppColors.white
                      : (isDark ? AppColors.grey200 : AppColors.grey900),
                ),
              ),
            ),
          ),
          if (message.isUser) const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  final bool isDark;
  const _TypingIndicator({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.smart_toy_rounded,
                color: AppColors.white, size: 16),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : AppColors.grey100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: AppColors.grey400,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isDark;
  final VoidCallback onSend;
  final VoidCallback onVoice;

  const _ChatInput({
    required this.controller,
    required this.isDark,
    required this.onSend,
    required this.onVoice,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.fromLTRB(
        12, 8, 12,
        MediaQuery.of(context).padding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkElevated : AppColors.grey200,
          ),
        ),
      ),
      child: Row(
        children: [
          // Voice
          IconButton(
            onPressed: onVoice,
            icon: Icon(
              Icons.mic_rounded,
              color: isDark ? AppColors.lightGreen : AppColors.forestGreen,
            ),
          ),
          // Input
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: 4,
              minLines: 1,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: isDark ? AppColors.grey200 : AppColors.grey900,
              ),
              decoration: InputDecoration(
                hintText: 'Posez votre question juridique...',
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.grey500,
                ),
                filled: true,
                fillColor: isDark ? AppColors.darkCard : AppColors.grey100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Send
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: onSend,
              icon: const Icon(Icons.send_rounded,
                  color: AppColors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
