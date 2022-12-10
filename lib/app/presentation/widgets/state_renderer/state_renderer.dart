import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

enum StateRendererType {
  // popup states (dialogs)
  popupLoadingState,
  popupErrorState,

}

class StateRenderer extends StatelessWidget {
  const StateRenderer({
    Key? key,
    required this.stateRendererType,
    this.title = "",
    this.message = StringManager.loading,
    required this.retryActionFunction,
  }) : super(key: key);

  final StateRendererType stateRendererType;
  final String title;
  final String message;
  final void Function()? retryActionFunction;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context, stateRendererType);
  }

  Widget _getStateWidget(BuildContext context, StateRendererType stateRendererType) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [_getLoadingStateItem()]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [_getRetryStateItem()]);
    }
  }

  Widget _getLoadingStateItem() {
    return Card(
      child: SizedBox(
        height: 80,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text(StringManager.loading),
          ],
        ),
      ),
    );
  }
  Widget _getRetryStateItem() {
    return Card(
      child: SizedBox(
        height: 80,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(StringManager.loading),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: retryActionFunction,
              child: const Text(StringManager.retry),
            )
          ],
        ),
      ),
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
      elevation: 1.5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          boxShadow: [
            BoxShadow(color: Colors.black26)
          ]
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
