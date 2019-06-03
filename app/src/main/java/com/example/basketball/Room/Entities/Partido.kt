package com.example.basketball.Room.Entities

import android.os.Parcel
import android.os.Parcelable
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

) : Parcelable {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id_Partido") var id : Int = 0

    constructor(parcel: Parcel) : this(
            parcel.readString(),
            parcel.readInt(),
            parcel.readString(),
            parcel.readInt(),
            parcel.readString(),
            parcel.readString(),
            parcel.readString()) {
        id = parcel.readInt()
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(EquipoA)
        parcel.writeInt(ScoreA)
        parcel.writeString(EquipoB)
        parcel.writeInt(ScoreB)
        parcel.writeString(Ganador)
        parcel.writeString(fecha)
        parcel.writeString(hora)
        parcel.writeInt(id)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<Partido> {
        override fun createFromParcel(parcel: Parcel): Partido {
            return Partido(parcel)
        }

        override fun newArray(size: Int): Array<Partido?> {
            return arrayOfNulls(size)
        }
    }
}