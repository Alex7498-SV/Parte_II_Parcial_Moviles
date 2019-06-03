package com.example.basketball.Activities

import android.content.Intent
import android.os.Bundle
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity;
import android.view.Menu
import android.view.MenuItem
import android.widget.Toast
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.basketball.Adapter.RVAdapter
import com.example.basketball.R
import com.example.basketball.ViewModel.PartidoViewModel

import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private lateinit var partidoViewModel: PartidoViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        partidoViewModel = ViewModelProviders.of(this).get(PartidoViewModel::class.java)

        fab.setOnClickListener { view ->
            val intent = Intent(this@MainActivity, NewPartido::class.java)
            startActivity(intent)
        }

        val recyclerView = findViewById<RecyclerView>(R.id.rv_partidos)
        val adapter = RVAdapter(this, {partido : com.example.basketball.Room.Entities.Partido -> clickitem(partido)})

        partidoViewModel.allPartidos.observe(this, Observer { partidos ->
            partidos?.let { adapter.setPartidos(it) }
        })
        recyclerView.adapter = adapter
        recyclerView.layoutManager = LinearLayoutManager(this)
    }

    fun clickitem(partido: com.example.basketball.Room.Entities.Partido){

        Toast.makeText(this@MainActivity, "tocado", Toast.LENGTH_SHORT ).show()

        val dlc = Bundle()
        dlc.putParcelable("partido", partido)
        startActivity(Intent(this@MainActivity, Partido::class.java).putExtra("data", dlc))
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        return when (item.itemId) {
            R.id.action_settings -> true
            else -> super.onOptionsItemSelected(item)
        }
    }
}
