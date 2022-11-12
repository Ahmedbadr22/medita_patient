abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {

}

abstract class BaseViewModelInputs {
  /// called when the viewModel start
  void start();
  /// called when viewModel closed
  void dispose();
}

abstract class BaseViewModelOutputs {}