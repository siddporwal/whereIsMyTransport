import 'package:flutter/material.dart';

class Constants {
  static BuildContext mContext;
  static final String BaseURL = "";
  static final String LOGIN_URL = BaseURL + "/users/login";
  static final String SIGNUP_URL = BaseURL + "/users";
  static final String PROFILE = BaseURL + "/users/me";
  static final String BILL = BaseURL + "/addbill";
  static final String CUSTOMER = BaseURL + "/addcustomer";
  // SESSION PARAMETER

  static final String LOGIN_STATUS = "LOGIN_STATUS";
  static final String USER_ID = "USER_ID";
  static final String USER_FNAME = "USER_FNAME";
  static final String USER_LNAME = "USER_LNAME";
  static final String USER_MOBILE = "USER_MOBILE";
}
