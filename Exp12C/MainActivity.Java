package com.example.authappas;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnSignIn = findViewById(R.id.btnSignIn);
        Button btnSignUp = findViewById(R.id.btnSignUp);

        btnSignIn.setOnClickListener(v ->
                startActivity(new Intent(MainActivity.this, SignInActivity.class)));

        btnSignUp.setOnClickListener(v ->
                startActivity(new Intent(MainActivity.this, SignUpActivity.class)));
    }
}