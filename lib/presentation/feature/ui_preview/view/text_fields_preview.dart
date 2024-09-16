import 'package:flutter/material.dart';
import 'package:hack_yeah_2k24/presentation/common/components/card.dart';
import 'package:hack_yeah_2k24/presentation/common/components/text_field.dart';

class TextFieldsPreview extends StatefulWidget {
  const TextFieldsPreview({super.key});

  @override
  State<TextFieldsPreview> createState() => _TextFieldsPreviewState();
}

class _TextFieldsPreviewState extends State<TextFieldsPreview> {
  @override
  Widget build(BuildContext context) => const UiCard(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiTextField.standard(
                  style: UiTextFieldStyle(
                    hintText: 'Text input',
                  ),
                ),
                SizedBox(height: 16),
                UiTextField.standard(
                  style: UiTextFieldStyle(
                    hintText: 'Text input',
                    helperText: 'Helper',
                  ),
                ),
                SizedBox(height: 16),
                UiTextField.standard(
                  style: UiTextFieldStyle(
                    hintText: 'Text input',
                    errorText: 'Error',
                  ),
                ),
                SizedBox(height: 16),
                UiTextField.standard(
                  showCounter: true,
                  maxLength: 10,
                  style: UiTextFieldStyle(hintText: 'Text input'),
                ),
                SizedBox(height: 16),
                UiTextField.standard(
                  showCounter: true,
                  enabled: false,
                  style: UiTextFieldStyle(
                    hintText: 'Disabled',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
