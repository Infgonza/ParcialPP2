package entidades;
import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="detalle_factura")
public class DetalleFactura implements Serializable {
	
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(name="cantidad")
    private int cantidad;
    @Column(name="subtotal")
    private double subtotal;
    
    //RELACION BIDIRECCION CON FACTURA
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "fk_factura")
    private Factura factura;
    
    //DetalleFactura propietaria de la relacion con Disco
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "fk_disco")
	private Disco disco;
    
    public DetalleFactura() {
    }

	public DetalleFactura(int cantidad, double subtotal) {
		this.cantidad = cantidad;
		this.subtotal = subtotal;
	}

	public DetalleFactura(int cantidad, double subtotal, Factura factura) {
		this.cantidad = cantidad;
		this.subtotal = subtotal;
		this.factura = factura;
	}
	public DetalleFactura(int cantidad, double subtotal, Disco disco) {
        this.cantidad = cantidad;
        this.subtotal = subtotal;
        this.disco = disco;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Factura getFactura() {
		return factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

	public Disco getDisco() {
		return disco;
	}

	public void setDisco(Disco disco) {
		this.disco = disco;
	}
	
    
}
