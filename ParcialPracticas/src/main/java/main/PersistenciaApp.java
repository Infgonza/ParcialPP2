package main;
import javax.persistence.*;

import entidades.Cliente;
import entidades.DetalleFactura;
import entidades.Disco;
import entidades.Domicilio;
import entidades.Factura;
import entidades.Genero;
public class PersistenciaApp {

	public static void main(String [] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersistenceAppPU");
		EntityManager em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			Factura fact1 = new Factura();
			
			fact1.setFecha("06/09/2024");
			
			Domicilio dom = new Domicilio("San Juan", 1655);
			Cliente cliente1= new Cliente("Rodrigo", "Garcia", 12345);
			cliente1.setDomicilio(dom);
			dom.setCliente(cliente1);
			
			fact1.setCliente(cliente1);
			
			Genero rock = new Genero("Rock");
			Genero pop = new Genero("Pop");
			Genero rockAlternativo = new Genero("Rock Alternativo");
			
			Disco disco1 = new Disco("Angel Dust", "Faith No More", 150, "Rock");
			Disco disco2 = new Disco("Jessico", "Babasonicos", 200, "Pop");
			Disco disco3 = new Disco("Wish", "The cure", 170, "Rock Alternativo");
			
			disco1.getGeneros().add(rock);
			disco1.getGeneros().add(rockAlternativo);
			disco2.getGeneros().add(pop);
			disco2.getGeneros().add(rock);
			disco3.getGeneros().add(rockAlternativo);
			
			rock.getDiscos().add(disco1);
			rock.getDiscos().add(disco2);
			pop.getDiscos().add(disco2);
			rockAlternativo.getDiscos().add(disco1);
			rockAlternativo.getDiscos().add(disco3);
			
			DetalleFactura det1 = new DetalleFactura();
			det1.setDisco(disco1);
			det1.setCantidad(2);
			det1.setSubtotal(300);
			
			disco1.getDetalle_factura().add(det1);
			fact1.getDetalles().add(det1);
			det1.setFactura(fact1);
			
			DetalleFactura det2 = new DetalleFactura();
			det2.setDisco(disco2);
			det2.setCantidad(3);
			det2.setSubtotal(600);
			
			disco2.getDetalle_factura().add(det2);
			fact1.getDetalles().add(det2);
			det2.setFactura(fact1);
			
			DetalleFactura det3 = new DetalleFactura();
			det3.setDisco(disco3);
			det3.setCantidad(1);
			det3.setSubtotal(170);
			
			disco3.getDetalle_factura().add(det3);
			fact1.getDetalles().add(det3);
			det3.setFactura(fact1);
			
			fact1.setTotal(1070);
			
			em.persist(fact1);
			
			
			
			em.flush();
            
            em.getTransaction().commit();
            
		} catch (Exception e) {
			em.getTransaction().rollback();
			
		}
		em.close();
		emf.close();
	}
}	
