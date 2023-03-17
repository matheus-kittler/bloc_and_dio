package kittler.matheus.bloc_and_dio_test

import android.inputmethodservice.InputMethodService
import android.view.View

class SharedInputMethodServices : InputMethodService() {
    override fun onCreateInputView(): View {
        return layoutInflater.inflate(R.layout.keyboard_main, null)
    }
}