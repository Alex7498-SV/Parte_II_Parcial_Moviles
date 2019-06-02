package com.example.basketball.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.basketball.R
import com.example.basketball.Room.Entities.Partido

class RVAdapter internal constructor(context: Context, var clicklistener: (Partido) -> Unit) : RecyclerView.Adapter<RVAdapter.ViewHolder>(){

    private val inflater : LayoutInflater = LayoutInflater.from(context)
    private var partidos = emptyList<Partido>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RVAdapter.ViewHolder {
        val itemView = inflater.inflate(R.layout.rv_content, parent, false)
        return ViewHolder(itemView)
    }

    override fun getItemCount() = partidos.size

    override fun onBindViewHolder(holder: RVAdapter.ViewHolder, position: Int) {
        val current =  partidos[position]
        holder.onBind(current, clicklistener)
    }

    inner class ViewHolder(itemView : View) : RecyclerView.ViewHolder(itemView){

        fun onBind(partido: Partido, clicklistener: (Partido) -> Unit){
            equipoA.text = partido.EquipoA
            equipoB.text = partido.EquipoB
            scoreA.text = partido.ScoreA.toString()
            scoreB.text = partido.ScoreB.toString()
        }

        val equipoA : TextView = itemView.findViewById(R.id.tv_eqA)
        val scoreA : TextView = itemView.findViewById(R.id.tv_scrA)
        val equipoB : TextView = itemView.findViewById(R.id.tv_eqB)
        val scoreB : TextView = itemView.findViewById(R.id.tv_scrB)

    }

    internal  fun setPartidos(partidos: List<Partido>){
        this.partidos = partidos
        notifyDataSetChanged()
    }
}