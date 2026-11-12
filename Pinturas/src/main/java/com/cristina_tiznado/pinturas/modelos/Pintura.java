package com.cristina_tiznado.pinturas.modelos;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "pinturas")
public class Pintura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Por favor, proporcionar titulo.")
    @Size(min = 5, message = "Debe contener al menos 5 caracteres.")
    private String titulo;

    @NotNull(message = "Por favor, proporcionar año.")
    @Min(value = 1, message = "Debe ser un valor positivo.")
    private Integer anio;

    @NotBlank(message = "Por favor, proporcionar descripción.")
    @Size(min = 10, message = "Debe contener al menos 10 caracteres.")
    private String descripcion;

    @NotBlank(message = "Por favor, proporcionar URL.")
    @Pattern(regexp = "^(.*\\.(?i)(jpg|jpeg|png|gif|bmp))$", message = "La URL de la imagen debe de terminar con la extensión de algún formato de imagen.")
    private String url;

    @NotNull(message = "Por favor, proporcionar cantidad.")
    @Min(value = 0, message = "Debe ser un valor positivo.")
    private Integer cantidad;

    @NotNull(message = "Por favor, proporcionar precio.")
    @Min(value = 1, message = "Debe ser un valor positivo.")
    private Double precio;

    @ManyToOne
    @JoinColumn(name = "id_usuario")
    private Usuario creador;

    @ManyToMany
    @JoinTable(name = "compras", joinColumns = @JoinColumn(name = "id_pintura"), inverseJoinColumns = @JoinColumn(name = "id_usuario"))
    private List<Usuario> compradores;

    public Pintura(){}

    public Pintura(String titulo, Integer anio, String descripcion, String url, Integer cantidad, Double precio) {
        this.titulo = titulo;
        this.anio = anio;
        this.descripcion = descripcion;
        this.url = url;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public List<Usuario> getCompradores() {
        return compradores;
    }

    public void setCompradores(List<Usuario> compradores) {
        this.compradores = compradores;
    }

    public Usuario getCreador() {
        return creador;
    }

    public void setCreador(Usuario creador) {
        this.creador = creador;
    }

    
}
