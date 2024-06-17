package entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
@Entity
@Table(name="Disco")
public class Disco implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name="titulo")
    private String titulo;
    @Column(name="autor")
    private String autor;
    @Column(name="precio")
    private int precio;
    @Column(name="denominacion")
    private String denominacion;

    //Hacemos la bidireccionalidad
    @OneToMany(mappedBy="disco", cascade = CascadeType.PERSIST)
    private List<DetalleFactura> detalle_factura = new ArrayList<DetalleFactura>();
    
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}) //persiste y se actualiza(merge)
    @JoinTable(name="disco_genero",
    			joinColumns= @JoinColumn(name="disco_id"),
    			inverseJoinColumns= @JoinColumn(name="genero_id"))
    private List<Genero> generos = new ArrayList <Genero>();

	public Disco() {
	}

	public Disco(String titulo, String autor, int precio, String denominacion, List<DetalleFactura> detalle_factura,
			List<Genero> generos) {
		this.titulo = titulo;
		this.autor = autor;
		this.precio = precio;
		this.denominacion = denominacion;
		this.detalle_factura = detalle_factura;
		this.generos = generos;
	}

	public Disco(String titulo, String autor, int precio, String denominacion, List<DetalleFactura> detalle_factura) {
		this.titulo = titulo;
		this.autor = autor;
		this.precio = precio;
		this.denominacion = denominacion;
		this.detalle_factura = detalle_factura;
	}

	public Disco(String titulo, String autor, int precio, String denominacion) {
		this.titulo = titulo;
		this.autor = autor;
		this.precio = precio;
		this.denominacion = denominacion;
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

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public String getDenominacion() {
		return denominacion;
	}

	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}

	public List<DetalleFactura> getDetalle_factura() {
		return detalle_factura;
	}

	public void setDetalle_factura(List<DetalleFactura> detalle_factura) {
		this.detalle_factura = detalle_factura;
	}

	public List<Genero> getGeneros() {
		return generos;
	}

	public void setGeneros(List<Genero> generos) {
		this.generos = generos;
	}
    
	
    
    
   

}
