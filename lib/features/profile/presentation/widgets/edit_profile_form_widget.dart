import 'dart:io';
import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/form_text_field.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/update_profile/update_pelanggan_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/custom_appbar.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/select_image.dart';
import 'package:antria_mobile_pelanggan/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileFormWidget extends StatefulWidget {
  const EditProfileFormWidget({super.key});

  @override
  State<EditProfileFormWidget> createState() => _EditProfileFormWidgetState();
}

class _EditProfileFormWidgetState extends State<EditProfileFormWidget> {
  final formKey = GlobalKey<FormState>();
  File? selectedImage;
  String email = '';
  String username = '';
  String name = '';
  String phone = '';
  String address = '';
  ValidatorForm validatorForm = ValidatorForm();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PelangganProfileBloc()
        ..add(
          PelangganProfileFetchData(),
        ),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Edit Profile',
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        backgroundColor: backgroundGreyColor,
        body: BlocBuilder<PelangganProfileBloc, PelangganProfileState>(
          builder: (context, state) {
            if (state is PelangganProfileError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (state is PelangganProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: primaryColor,
                          backgroundImage: (selectedImage == null &&
                                  state.pelangganModel.profilePicture!
                                      .isNotEmpty)
                              ? NetworkImage(
                                  '${APIUrl.baseUrl}${APIUrl.imagePath}${state.pelangganModel.profilePicture}',
                                )
                              : (selectedImage != null)
                                  ? FileImage(selectedImage!)
                                  : const AssetImage(
                                      'assets/icons/user-empty.png',
                                    ) as ImageProvider,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: whiteColor,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              builder: (context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.34,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final path =
                                                await selectImageFromGallery();
                                            if (path != null) {
                                              setState(() {
                                                selectedImage = File(path);
                                                Navigator.pop(context);
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.photo_library),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Pilih dari Galeri',
                                                  style: blackTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final path =
                                                await selectImageFromCamera();
                                            if (path != null) {
                                              setState(() {
                                                selectedImage = File(path);
                                                Navigator.pop(context);
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 20,
                                            ),
                                            decoration: BoxDecoration(
                                              color: greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.camera_alt),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Ambil Foto',
                                                  style: blackTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: whiteColor,
                            child: Icon(
                              Icons.edit,
                              color: blackColor,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${state.pelangganModel.username}',
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${state.pelangganModel.email}',
                      style: greyTextStyle,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFieldWidget(
                              initialValue: state.pelangganModel.email,
                              onChanged: (value) {
                                email = value.trim();
                              },
                              hintText: 'Email',
                              validator: validatorForm.validateEmail,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Username',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFieldWidget(
                              onChanged: (value) {
                                username = value.trim();
                              },
                              initialValue: state.pelangganModel.username,
                              hintText: 'Username',
                              validator: validatorForm.validateUsername,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Nama Lengkap',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFieldWidget(
                              onChanged: (value) {
                                name = value.trim();
                              },
                              initialValue: state.pelangganModel.nama,
                              hintText: 'Nama',
                              validator: validatorForm.validateName,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Nomor Handphone',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFieldWidget(
                              initialValue: state.pelangganModel.handphone,
                              onChanged: (value) {
                                phone = value.trim();
                              },
                              type: TextInputType.phone,
                              hintText: 'Nomor Telepon',
                              // validator: validatorForm.validatePhone,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Alamat',
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFieldWidget(
                              initialValue: state.pelangganModel.alamat,
                              onChanged: (value) {
                                address = value.trim();
                              },
                              hintText: 'Alamat',
                              // validator: validatorForm.validateAlamat,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar:
            BlocConsumer<UpdatePelangganBloc, UpdatePelangganState>(
          listener: (context, state) {
            if (state is UpdatePelangganFailed) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomButton(
                title: 'Simpan Perubahan',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final currentState =
                        context.read<PelangganProfileBloc>().state;
                    if (currentState is PelangganProfileLoaded) {
                      final existingModel = currentState.pelangganModel;
                      bool isImageUpdated = selectedImage != null;
                      bool isTextFieldsUpdated = email.isNotEmpty ||
                          username.isNotEmpty ||
                          name.isNotEmpty ||
                          phone.isNotEmpty ||
                          address.isNotEmpty;

                      if (isImageUpdated && !isTextFieldsUpdated) {
                        final updateEvent = UpdatePelangganTapped(
                          requestUser: UpdatePelangganRequestModel(
                            profilePicture: selectedImage!.path,
                            email: existingModel.email,
                            username: existingModel.username,
                            nama: existingModel.nama,
                            handphone: existingModel.handphone,
                            alamat: existingModel.alamat,
                          ),
                        );
                        context.read<UpdatePelangganBloc>().add(updateEvent);
                      } else if (!isImageUpdated && isTextFieldsUpdated) {
                        final updateEvent = UpdatePelangganTapped(
                          requestUser: UpdatePelangganRequestModel(
                            email:
                                email.isNotEmpty ? email : existingModel.email,
                            username: username.isNotEmpty
                                ? username
                                : existingModel.username,
                            nama: name.isNotEmpty ? name : existingModel.nama,
                            handphone: phone.isNotEmpty
                                ? phone
                                : existingModel.handphone,
                            alamat: address.isNotEmpty
                                ? address
                                : existingModel.alamat,
                          ),
                        );
                        context.read<UpdatePelangganBloc>().add(updateEvent);
                      } else if (isImageUpdated && isTextFieldsUpdated) {
                        final updateEvent = UpdatePelangganTapped(
                          requestUser: UpdatePelangganRequestModel(
                            profilePicture: selectedImage!.path,
                            email:
                                email.isNotEmpty ? email : existingModel.email,
                            username: username.isNotEmpty
                                ? username
                                : existingModel.username,
                            nama: name.isNotEmpty ? name : existingModel.nama,
                            handphone: phone.isNotEmpty
                                ? phone
                                : existingModel.handphone,
                            alamat: address.isNotEmpty
                                ? address
                                : existingModel.alamat,
                          ),
                        );
                        context.read<UpdatePelangganBloc>().add(updateEvent);
                      }
                    }
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
