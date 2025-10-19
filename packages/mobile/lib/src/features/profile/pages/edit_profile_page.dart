import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

/// Edit profile page
///
/// Form to update user profile information including:
/// - Full name
/// - Phone number
/// - Bio
/// - Date of birth
/// - Address details
class EditProfilePage extends StatefulWidget {
  final ProfileEntity profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _bioController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _provinceController;
  late final TextEditingController _postalCodeController;
  late final TextEditingController _countryController;

  DateTime? _selectedDateOfBirth;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.profile.fullName);
    _phoneController = TextEditingController(text: widget.profile.phone ?? '');
    _bioController = TextEditingController(text: widget.profile.bio ?? '');
    _addressController = TextEditingController(text: widget.profile.address ?? '');
    _cityController = TextEditingController(text: widget.profile.city ?? '');
    _provinceController = TextEditingController(text: widget.profile.province ?? '');
    _postalCodeController = TextEditingController(text: widget.profile.postalCode ?? '');
    _countryController = TextEditingController(text: widget.profile.country ?? 'Canada');
    _selectedDateOfBirth = widget.profile.dateOfBirth;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ProfileBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          actions: [
            TextButton(
              onPressed: _saveProfile,
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (profile) {
                // Show success message and pop
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile updated successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
                context.pop();
              },
              error: (message) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: AppColors.error,
                  ),
                );
              },
            );
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile completion progress
                  _buildProgressIndicator(),

                  const SizedBox(height: AppSpacing.lg),

                  // Basic Information
                  Text(
                    'Basic Information',
                    style: AppTypography.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTextField(
                    controller: _fullNameController,
                    label: 'Full Name',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Invalid phone number format';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildDatePicker(),
                  const SizedBox(height: AppSpacing.md),
                  _buildTextField(
                    controller: _bioController,
                    label: 'Bio',
                    icon: Icons.info_outline,
                    maxLines: 3,
                    maxLength: 500,
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Address Information
                  Text(
                    'Address',
                    style: AppTypography.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTextField(
                    controller: _addressController,
                    label: 'Street Address',
                    icon: Icons.home,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTextField(
                          controller: _cityController,
                          label: 'City',
                          icon: Icons.location_city,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: _buildTextField(
                          controller: _provinceController,
                          label: 'Province',
                          icon: Icons.map,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _postalCodeController,
                          label: 'Postal Code',
                          icon: Icons.markunread_mailbox,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              final postalCodeRegex = RegExp(
                                r'^[A-Za-z]\d[A-Za-z][\s\-]?\d[A-Za-z]\d$',
                              );
                              if (!postalCodeRegex.hasMatch(value.replaceAll(' ', ''))) {
                                return 'Invalid postal code (A1A 1A1)';
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: _buildTextField(
                          controller: _countryController,
                          label: 'Country',
                          icon: Icons.flag,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final percentage = widget.profile.profileCompletionPercentage;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile Completion',
                  style: AppTypography.titleSmall,
                ),
                Text(
                  '$percentage%',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: AppColors.surfaceVariant,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int? maxLines,
    int? maxLength,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        counterText: maxLength != null ? null : '',
      ),
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      validator: validator,
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: _selectDate,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Date of Birth',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        child: Text(
          _selectedDateOfBirth != null
              ? '${_selectedDateOfBirth!.day}/${_selectedDateOfBirth!.month}/${_selectedDateOfBirth!.year}'
              : 'Not set',
          style: AppTypography.bodyLarge,
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final minDate = DateTime(now.year - 100);
    final maxDate = DateTime(now.year - 13); // Must be at least 13 years old

    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateOfBirth ?? maxDate,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (picked != null && picked != _selectedDateOfBirth) {
      setState(() {
        _selectedDateOfBirth = picked;
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final fullName = _fullNameController.text.trim();
      final phone = _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim();
      final bio = _bioController.text.trim().isEmpty
          ? null
          : _bioController.text.trim();
      final address = _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim();
      final city = _cityController.text.trim().isEmpty
          ? null
          : _cityController.text.trim();
      final province = _provinceController.text.trim().isEmpty
          ? null
          : _provinceController.text.trim();
      final postalCode = _postalCodeController.text.trim().isEmpty
          ? null
          : _postalCodeController.text.trim();
      final country = _countryController.text.trim().isEmpty
          ? null
          : _countryController.text.trim();

      context.read<ProfileBloc>().add(
            ProfileEvent.updateProfile(
              userId: widget.profile.id,
              fullName: fullName != widget.profile.fullName ? fullName : null,
              phone: phone != widget.profile.phone ? phone : null,
              bio: bio != widget.profile.bio ? bio : null,
              dateOfBirth: _selectedDateOfBirth != widget.profile.dateOfBirth
                  ? _selectedDateOfBirth
                  : null,
              address: address != widget.profile.address ? address : null,
              city: city != widget.profile.city ? city : null,
              province: province != widget.profile.province ? province : null,
              postalCode: postalCode != widget.profile.postalCode ? postalCode : null,
              country: country != widget.profile.country ? country : null,
            ),
          );
    }
  }
}
