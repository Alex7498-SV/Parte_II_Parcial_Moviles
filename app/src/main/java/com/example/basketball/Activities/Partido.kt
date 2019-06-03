package com.example.basketball.Activities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.basketball.R
import com.example.basketball.Room.Entities.Partido
import com.example.basketball.ViewModel.PartidoViewModel

class Partido : AppCompatActivity() {

    lateinit var vmP : PartidoViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_partido)

        var dlc : Bundle = this.intent.getBundleExtra("edu es gay")

        var partidazo : Partido = dlc.getParcelable("pedazo de mierda")



    }
}
