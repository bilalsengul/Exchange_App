import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFF3783F5);
const kTextColor = Color(0xFF757575);



const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "E-mail adresi boş geçilemez";
const String kInvalidEmailError = "Lütfen geçerli bir e-mail adresi giriniz";
const String kPassNullError = "Şifre alanı boş geçilemez";
const String kShortPassError = "Parola en az 7 karakterden oluşmalı";
const String kNamelNullError = "Ad alanı boş geçilemez";
const String kSurnameNullError = "Soyad alanı boş geçilemez";
const String kUsernameNullError = "Kullanıcı adı aannı boş geçilemez";
