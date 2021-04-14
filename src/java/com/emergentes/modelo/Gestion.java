package com.emergentes.modelo;

/**
 *
 * @author Estefany
 */
public class Gestion {
    private int id;
    private String nombre;
    private float peso;
    private float talla;
    private String vacuna;
    
    public Gestion() {
        id = 0;
        nombre = "";
        peso = 0;
        talla = 0;
        vacuna = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getTalla() {
        return talla;
    }

    public void setTalla(float talla) {
        this.talla = talla;
    }

    public String getVacuna() {
        return vacuna;
    }

    public void setVacuna(String vacuna) {
        this.vacuna = vacuna;
    }
    
}
