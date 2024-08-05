class ValidatorForm {
  String? validateEmail(String? value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Email Tidak Boleh Kosong!';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Masukan Alamat Email Dengan Benar!';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username Tidak Boleh Kosong!';
    } else if (value.length < 6) {
      return 'Username harus terdiri dari 6 karakter!';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama Tidak Boleh Kosong!';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor Handphone Tidak Boleh Kosong!';
    }
    return null;
  }

  String? validateAlamat(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat Tidak Boleh Kosong!';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan Password Anda';
    } else if (value.length < 6) {
      return 'Password harus terdiri dari 6 karakter!';
    }
    return null;
  }
}
