package com.example.basketball.Adapter

import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.basketball.R
import com.example.basketball.Room.Entities.Partido
import kotlinx.android.synthetic.main.rv_content.view.*

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
        Log.d("nigga", current.Ganador)
        holder.onBind(current, clicklistener)
    }

    inner class ViewHolder(item : View) : RecyclerView.ViewHolder(item){

        fun onBind ( partido : Partido, clickListener: (Partido) -> Unit) = with(itemView){
            itemView.tv_eqA.text = partido.EquipoA
            itemView.tv_eqB.text = partido.EquipoB
            itemView.tv_scrA.text = partido.ScoreA.toString()
            itemView.tv_scrB.text = partido.ScoreB.toString()
            this.setOnClickListener { clickListener(partido) }
        }

    }

    internal fun setPartidos(partidos: List<Partido>){
        this.partidos = partidos
        notifyDataSetChanged()
    }
}