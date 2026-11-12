package com.cristina_tiznado.pinturas.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cristina_tiznado.pinturas.modelos.Pintura;
import com.cristina_tiznado.pinturas.repositorios.RepositorioPinturas;

@Service
public class ServicioPintura {

    @Autowired
    private RepositorioPinturas repositorioPinturas;

    // SELECT
    public List<Pintura> obtenerTodasLasPinturas(){
        return this.repositorioPinturas.findAll();
    }

    public Pintura obtenerPinturaPorId(Long id){
        return this.repositorioPinturas.findById(id).orElse(null);
    }

    public Pintura existeTitulo(String titulo) {
        return this.repositorioPinturas.findByTitulo(titulo).orElse(null);
    }

    // INSERT
    public Pintura crearPintura(Pintura pintura){
        return this.repositorioPinturas.save(pintura);
    }

    // UPDATE
    public Pintura modificarPintura(Pintura pintura){
        return this.repositorioPinturas.save(pintura);
    }

    // DELETE
    public void eliminarPintura(Long id){
        this.repositorioPinturas.deleteById(id);
    }
}
