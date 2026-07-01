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
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "usuarios")
public class Usuario implements Cloneable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Por favor, proporciona un nombre.")
    @Size(min = 3, message = "Debe contener al menos 3 caracteres.")
    private String nombre;

    @NotBlank(message = "Por favor, proporciona un apellido.")
    @Size(min = 3, message = "Debe contener al menos 3 caracteres.")
    private String apellido;

    @NotBlank(message = "Por favor, proporciona un correo electronico.")
    @Email(message = "Por favor, proporciona un correo valido.")
    private String correo;

    @NotBlank(message = "Por favor, proporciona una contraseña.")
    @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres.")
    private String password;

    @Transient
    private String confirmarPassword;

    @OneToMany(mappedBy = "creador")
    private List<Pintura> misPinturas;

    @ManyToMany
    @JoinTable(name = "compras", joinColumns = @JoinColumn(name = "id_usuario"), inverseJoinColumns = @JoinColumn(name = "id_pintura"))
    private List<Pintura> pinturasCompradas;

    public Usuario() {
    }

    public Usuario(String nombre, String apellido, String correo, String password) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmarPassword() {
        return confirmarPassword;
    }

    public void setConfirmarPassword(String confirmarPassword) {
        this.confirmarPassword = confirmarPassword;
    }

    public List<Pintura> getPinturasCompradas() {
        return pinturasCompradas;
    }

    public void setPinturasCompradas(List<Pintura> pinturasCompradas) {
        this.pinturasCompradas = pinturasCompradas;
    }

    @Override
    public String toString() {
        return "Usuario [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo
                + ", password=" + password + ", confirmarPassword=" + confirmarPassword + ", pinturasCompradas="
                + pinturasCompradas + "]";
    }

    @Override
    public Usuario clone(){
        try {
            return (Usuario) super.clone();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Pintura> getMisPinturas() {
        return misPinturas;
    }

    public void setMisPinturas(List<Pintura> misPinturas) {
        this.misPinturas = misPinturas;
    }
}
