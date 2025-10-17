import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Registration form widget with full name, email and password fields
class RegisterForm extends StatefulWidget {
  final bool isLoading;
  final void Function(String email, String password, String fullName) onSubmit;

  const RegisterForm({
    super.key,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(
        _emailController.text.trim(),
        _passwordController.text,
        _fullNameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name Field
          TextFormField(
            controller: _fullNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            enabled: !widget.isLoading,
            decoration: const InputDecoration(
              labelText: 'Nom complet',
              hintText: 'Jean Dupont',
              prefixIcon: Icon(Icons.person_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre nom complet';
              }
              if (value.length < 3) {
                return 'Le nom doit contenir au moins 3 caractères';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),

          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            enabled: !widget.isLoading,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'votre@email.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre email';
              }
              if (!Validators.isValidEmail(value)) {
                return 'Email invalide';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.next,
            enabled: !widget.isLoading,
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              hintText: 'Minimum 8 caractères',
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un mot de passe';
              }
              if (value.length < 8) {
                return 'Le mot de passe doit contenir au moins 8 caractères';
              }
              if (!Validators.isStrongPassword(value)) {
                return 'Le mot de passe doit contenir au moins une majuscule, une minuscule et un chiffre';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.md),

          // Confirm Password Field
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            textInputAction: TextInputAction.done,
            enabled: !widget.isLoading,
            onFieldSubmitted: (_) => _handleSubmit(),
            decoration: InputDecoration(
              labelText: 'Confirmer le mot de passe',
              hintText: 'Retapez votre mot de passe',
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez confirmer votre mot de passe';
              }
              if (value != _passwordController.text) {
                return 'Les mots de passe ne correspondent pas';
              }
              return null;
            },
          ),

          const SizedBox(height: AppSpacing.lg),

          // Register Button
          FilledButton(
            onPressed: widget.isLoading ? null : _handleSubmit,
            child: widget.isLoading
                ? const SizedBox(
                    height: AppSpacing.md,
                    width: AppSpacing.md,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text('S\'inscrire'),
          ),
        ],
      ),
    );
  }
}
