import 'package:MONO29/features/highlight/bloc/hightlight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HightlightDispatcher {
  static void disPatchIsContact(BuildContext context) {
    context.read<HightlightBloc>().add(HLSetIsContactEvent(true));
  }
}
