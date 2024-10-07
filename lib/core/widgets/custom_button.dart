import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    this.onTab,
    this.isLoading = false,
    required this.color,
    required this.textColor,
    this.image,
    this.style,
  });

  final String buttonName;
  final VoidCallback? onTab;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final String? image;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTab,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          height: 54,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
          ),
          child: image == null
              ? Center(
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: textColor,
                        )
                      : Text(
                          buttonName,
                          style: style,
                        ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(flex: 5),
                    isLoading
                        ? CircularProgressIndicator(
                            color: textColor,
                          )
                        : Text(
                            buttonName,
                            style: style,
                          ),
                    const Spacer(flex: 4),
                    image != null ? Image.asset(image!) : const SizedBox(),
                  ],
                ),
        ));
  }
}
