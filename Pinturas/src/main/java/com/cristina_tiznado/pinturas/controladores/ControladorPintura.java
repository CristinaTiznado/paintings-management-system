package com.cristina_tiznado.pinturas.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.cristina_tiznado.pinturas.modelos.Pintura;
import com.cristina_tiznado.pinturas.modelos.Usuario;
import com.cristina_tiznado.pinturas.servicios.ServicioPintura;
import com.cristina_tiznado.pinturas.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPintura {

    @Autowired
    private ServicioPintura servicioPintura;

    @Autowired
    private ServicioUsuario servicioUsuario;

    // ---------------------------------------

    // INICIO

    @GetMapping("/pinturas")
    public String pinturas(HttpSession sesion, Model modelo) {

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if (u == null) {
            return "redirect:/";
        }

        modelo.addAttribute("usuarioLogueado", u);
        modelo.addAttribute("pinturas", this.servicioPintura.obtenerTodasLasPinturas());
        modelo.addAttribute("pinturasCompradas",
                this.servicioUsuario.obtenerUsuarioPorId(u.getId()).getPinturasCompradas());

        return "pinturas.jsp";
    }

    // AGREGAR NUEVA PINTURA

    @GetMapping("/formulario/agregar")
    public String formularioAgregar(HttpSession sesion, Model modelo) {

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if (u == null) {
            return "redirect:/";
        }

        modelo.addAttribute("pintura", new Pintura());

        return "agregar.jsp";
    }

    @PostMapping("/agregar")
    public String agregar(@Valid @ModelAttribute("pintura") Pintura pintura, BindingResult validaciones,
            HttpSession sesion) {

        if (this.servicioPintura.existeTitulo(pintura.getTitulo()) != null) {
            validaciones.rejectValue("titulo", "Unique", "Ya existe una obra con este título en la galería.");
        }

        if (validaciones.hasErrors()) {
            return "agregar.jsp";
        }

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        pintura.setCreador(u);

        this.servicioPintura.crearPintura(pintura);

        return "redirect:/pinturas";
    }

    // EDITAR PINTURA

    @GetMapping("/formulario/editar/{id}")
    public String formularioEditar(@PathVariable("id") Long id, HttpSession sesion, Model modelo) {

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if (u == null) {
            return "redirect:/";
        }

        modelo.addAttribute("pintura", this.servicioPintura.obtenerPinturaPorId(id));

        return "editar.jsp";
    }

    @PostMapping("/editar")
    public String editar(@Valid @ModelAttribute("pintura") Pintura pintura, BindingResult validaciones) {

        Pintura pinturaExistente = this.servicioPintura.existeTitulo(pintura.getTitulo());

        // Si el título existe, Y el ID le pertenece a OTRA pintura distinta a la actual
        // -> Es un duplicado real
        if (pinturaExistente != null && !pinturaExistente.getId().equals(pintura.getId())) {
            validaciones.rejectValue("titulo", "Unique", "Ya existe otra obra con este título en la galería.");
        }

        if (validaciones.hasErrors()) {
            return "editar.jsp";
        }

        System.out.println(pintura.getCreador());

        this.servicioPintura.modificarPintura(pintura);

        return "redirect:/pinturas";
    }

    // ELIMINAR PINTURA

    @DeleteMapping("/eliminar/{id}")
    public String eliminar(@PathVariable("id") Long id) {

        this.servicioPintura.eliminarPintura(id);

        return "redirect:/pinturas";
    }

    // DETALLE PINTURA

    @GetMapping("/detalle/{id}")
    public String detalle(HttpSession sesion, @PathVariable("id") Long id, Model modelo) {

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if (u == null) {
            return "redirect:/";
        }

        modelo.addAttribute("pintura", this.servicioPintura.obtenerPinturaPorId(id));

        return "detalle.jsp";
    }

    // COMPRAR PINTURA
    @GetMapping("/comprar/{id}")
    public String comprar(@PathVariable("id") Long id, HttpSession sesion) {

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if (u == null) {
            return "redirect:/";
        }

        Pintura pintura = this.servicioPintura.obtenerPinturaPorId(id);

        if (pintura == null) {
            return "redirect:/pinturas";
        } else if (pintura.getCantidad() > 0) {
            pintura.setCantidad(pintura.getCantidad() - 1);

            Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());
            usuarioDB.getPinturasCompradas().add(pintura);

            this.servicioPintura.modificarPintura(pintura);
            this.servicioUsuario.modificarUsuario(usuarioDB);
        }

        return "redirect:/mis-compras";
    }

    // VISTA MIS COMPRAS
    @GetMapping("/mis-compras")
    public String misCompras(HttpSession sesion, Model modelo) {

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if (u == null) {
            return "redirect:/";
        }

        Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());

        modelo.addAttribute("usuarioLogueado", u);
        modelo.addAttribute("compras", usuarioDB.getPinturasCompradas());

        return "mis-compras.jsp";
    }

}
