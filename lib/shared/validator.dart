class ValidatorForm {
  String? validateNameToko(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama Toko Tidak Boleh Kosong!';
    } else if (value.length < 6) {
      return 'Nama Toko harus terdiri dari 6 karakter!';
    }
    return null;
  }

  String? validateDeskripsiToko(String? value) {
    if (value == null || value.isEmpty) {
      return 'Deskripsi Toko Tidak Boleh Kosong!';
    } else if (value.length < 6) {
      return 'Deskripsi Toko harus terdiri dari 6 karakter!';
    }
    return null;
  }

  String? validateAlamatToko(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat Toko Tidak Boleh Kosong!';
    } else if (value.length < 10) {
      return 'Alamat harus terdiri dari 10 karakter!';
    }
    return null;
  }

  String? validateEmail(String? value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Email Tidak Boleh Kosong!';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Masukkan Alamat Email Dengan Benar!';
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
    } else if (value.length < 6) {
      return 'Nama harus terdiri dari 6 karakter!';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor Handphone Tidak Boleh Kosong!';
    } else if (value.length < 12) {
      return 'Nomor Handphone harus terdiri dari 12 angka!';
    }
    return null;
  }

  String? validateAlamat(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat Tidak Boleh Kosong!';
    } else if (value.length < 10) {
      return 'Alamat harus terdiri dari 10 karakter!';
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
