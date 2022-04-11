
import 'package:flutter/material.dart';
import 'package:rapor_lc/app/dialogs/base_dialog.dart';
import 'package:rapor_lc/app/pages/admin-col/home/ui/teacher/admin_home_teacher_controller.dart';
import 'package:rapor_lc/app/widgets/form_field/form_dropdown_search.dart';
import 'package:rapor_lc/app/widgets/form_field/form_input_field_checkbox.dart';
import 'package:rapor_lc/domain/entities/divisi.dart';
import 'package:rapor_lc/domain/entities/teacher.dart';
import 'package:rapor_lc/app/widgets/form_field/form_input_field.dart';

class TeacherCreateDialog extends StatefulWidget {
  final Function(Teacher) onSave;
  final AdminHomeTeacherController controller;

  const TeacherCreateDialog({Key? key, required this.onSave, required this.controller,
  }) : super(key: key);

  @override
  State<TeacherCreateDialog> createState() => _TeacherCreateDialogState();
}

class _TeacherCreateDialogState extends State<TeacherCreateDialog> {
  final _key = GlobalKey<FormState>();
  late final TextEditingController _nameCon;
  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;
  bool _isLeaderCon = false;
  Divisi? _divisiCon;

  @override
  void initState() {
    _nameCon = TextEditingController();
    _emailCon = TextEditingController();
    _passwordCon = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Tambah Teacher',
      contents: [
        SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormInputField(
                  label: 'Name',
                  controller: _nameCon,
                ),
                FormInputField(
                  label: 'Email',
                  controller: _emailCon,
                ),
                FormInputField(
                  label: 'Password',
                  controller: _passwordCon,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: FormInputFieldCheckBox(
                    'Is Leader',
                    _isLeaderCon,
                    (val) {
                      setState(() {
                        _isLeaderCon = val;
                      });
                    },
                  ),
                ),
                FormDropdownSearch<Divisi>(
                  label: 'Divisi',
                  compareFn: (o1, o2) => o1 == o2,
                  onFind: widget.controller.dialogOnFindDivisi,
                  showItem: (item) => '${item.id} - ${item.name}',
                  onPick: (item) {
                    setState(() {
                      _divisiCon = item;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        BaseDialogActions(
          formKey: _key,
          onSave: () => widget.onSave(
            Teacher(0, _nameCon.text,
              email: _emailCon.text,
              password: _passwordCon.text,
              isLeader: _isLeaderCon,
              divisi: _divisiCon,
            ),
          ),
        ),
      ],
    );
  }
}