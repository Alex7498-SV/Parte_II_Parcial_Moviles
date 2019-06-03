package com.example.basketball.Activities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.basketball.R
import com.example.basketball.Room.Entities.Partido
import com.example.basketball.ViewModel.PartidoViewModel
import kotlinx.android.synthetic.main.activity_partido.*

class Partido : AppCompatActivity() {

    lateinit var vmP : PartidoViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_partido)

        var dlc : Bundle = this.intent.getBundleExtra("data")

        var partidazo : Partido = dlc.getParcelable("partido")

        tv_eqA1.text = partidazo.EquipoA
        tv_eqB1.text = partidazo.EquipoB
        tv_score1.text = partidazo.ScoreA.toString()
        tv_score2.text = partidazo.ScoreB.toString()
        tv_fecha.text = partidazo.fecha
        tv_hora.text = partidazo.hora
        tv_ganador.text = partidazo.Ganador



    }
}
