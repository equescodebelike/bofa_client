import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Политика конфиденциальности'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Политика конфиденциальности',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Общие положения\n\n'
              '1.1. Настоящая политика конфиденциальности определяет порядок обработки и защиты персональных данных.\n\n'
              '1.2. Целью настоящей политики конфиденциальности является обеспечение защиты прав и свобод человека и гражданина при обработке его персональных данных.\n\n'
              '2. Сбор информации\n\n'
              '2.1. Мы собираем следующие виды персональных данных:\n'
              '- Адрес электронной почты\n'
              '- Информация о входе в систему\n\n'
              '3. Использование информации\n\n'
              '3.1. Собранная информация используется для:\n'
              '- Аутентификации пользователей\n'
              '- Обеспечения безопасности\n'
              '- Улучшения качества обслуживания\n\n'
              '4. Защита информации\n\n'
              '4.1. Мы принимаем необходимые правовые, организационные и технические меры для защиты персональных данных.\n\n'
              '5. Контактная информация\n\n'
              '5.1. По всем вопросам, связанным с обработкой персональных данных, обращайтесь по электронной почте.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
} 