package com.example.basketball.Activities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.lifecycle.ViewModelProviders
import com.example.basketball.R
import com.example.basketball.Room.Entities.Partido
import com.example.basketball.ViewModel.PartidoViewModel
import kotlinx.android.synthetic.main.activity_new_partido.*
import kotlinx.android.synthetic.main.activity_new_partido.view.*
import java.text.SimpleDateFormat
import java.util.*

class NewPartido : AppCompatActivity() {

    lateinit var vmP : PartidoViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_new_partido)

        vmP = ViewModelProviders.of(this).get(PartidoViewModel::class.java)


        cptsA.text = vmP.contA.toString()
        cptsB.text= vmP.contB.toString()


        var cal = Calendar.getInstance()
        var sdf = SimpleDateFormat("dd-MM-yyyy")
        var fecha1 =sdf.format(cal.time)
        var shf = SimpleDateFormat("HH:mm")
        var hrs = shf.format(cal.time)

    }

    fun addone(view : View){

        when(view){
            add1A ->{
                vmP.contA +=1
            }
            add2A ->{
                vmP.contA +=2
            }
            add3A ->{
                vmP.contA +=3
            }
            add1B ->{
                vmP.contB +=1
            }
            add2B ->{
                vmP.contB +=2
            }
            add3B ->{
                vmP.contB +=3
            }
            save->{
                var fecha = "${dtpicker.dayOfMonth}/${dtpicker.month}/${dtpicker.year}"
                Log.d("fecha", "fecha: ${fecha}")
                if(!eqA.text.equals("") && !eqB.text.equals("") && et_hora.text.toString()<"24" && et_min.text.toString()<"59" && (vmP.contA > vmP.contB)){
                    var hora = "${et_hora.text.toString()}:${et_min.text.toString()}"
                    var partido = Partido(eqA.text.toString(), vmP.contA, eqB.text.toString(), vmP.contB, eqA.text.toString(), fecha, hora)
                    Toast.makeText(this, partido.Ganador, Toast.LENGTH_SHORT).show()
                    vmP.insert(partido)
                    Log.d("fecha", "insertado")
                }else{
                    Log.d("fecha", "no se guardo")
                }
                if(!eqA.text.equals("") && !eqB.text.equals("") && et_hora.text.toString()<"24" && et_min.text.toString()<"59" && (vmP.contA < vmP.contB)){
                    var hora = "${et_hora.toString()}:${et_min.toString()}"
                    var partido = Partido(eqA.text.toString(), vmP.contA, eqB.text.toString(), vmP.contB, eqB.text.toString(), fecha, hora)
                    Toast.makeText(this, partido.Ganador, Toast.LENGTH_SHORT).show()
                    vmP.insert(partido)
                    Log.d("fecha", "insertado")
                }else{
                    Log.d("fecha", "no se guardo")
                }

            }

        }

        cptsA.text = vmP.contA.toString()
        cptsB.text = vmP.contB.toString()
    }

}
