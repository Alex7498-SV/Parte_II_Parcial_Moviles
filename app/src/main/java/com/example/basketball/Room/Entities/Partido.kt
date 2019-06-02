package com.example.basketball.Room.Entities

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "Partido")
class Partido(

    @ColumnInfo(name = "P_EquipoA") var EquipoA : String,
    @ColumnInfo(name = "P_ScoreA") var ScoreA : Int,

    @ColumnInfo(name = "P_EquipoB") var EquipoB : String,
    @ColumnInfo(name = "P_ScoreB") var ScoreB : Int,

    @ColumnInfo(name = "P_ganador") var Ganador : String,

    @ColumnInfo(name = "P_fecha")  var fecha : String,
    @ColumnInfo(name = "P_hora") var hora : String

){
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id_Partido") var id : Int = 0
}