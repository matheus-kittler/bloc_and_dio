package kittler.matheus.bloc_and_dio_test

import android.annotation.TargetApi
import android.inputmethodservice.InputMethodService
import android.os.Build
import android.view.View

@TargetApi(Build.VERSION_CODES.CUPCAKE)
class SharedInputMethodServices : InputMethodService() {
    override fun onCreateInputView(): View {
        return layoutInflater.inflate(R.layout.keyboard_main, null)
    }
}