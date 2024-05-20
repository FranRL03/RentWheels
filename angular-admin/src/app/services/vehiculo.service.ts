import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListVehiculo } from '../models/list-vehiculo.interface';
import { environment } from '../environment/environment';
import { VehiculoAllDetails } from '../models/new-vehiculo.interface';

@Injectable({
  providedIn: 'root'
})
export class VehiculoService {

  constructor(private http: HttpClient) { }

  listVehiculos(page: number): Observable<ListVehiculo> {
    return this.http.get<ListVehiculo>(`${environment.apiBaseUrl}/admin/vehiculos?page=${page}`,
    
    {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    })
  }

  createVehiculo(imagen: string, combustion: string, transmision: string, capacidadPasajeros: number, autonomia: number, 
    potencia: number, estado: string, numPuertas: number, precioBase: number, modelo: string): Observable<VehiculoAllDetails> {
      return this.http.post<VehiculoAllDetails>(`${environment.apiBaseUrl}/admin/add/vehiculo`,
      {
        imagen: imagen,
        combustion: combustion,
        transmision: transmision,
        capacidadPasajeros: capacidadPasajeros,
        autonomia: autonomia,
        potencia:potencia,
        estado: estado,
        numPuertas: numPuertas,
        precioBase: precioBase,
        modelo: modelo
      }, {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      }
      )
    }

    edit(imagen: string, combustion: string, transmision: string, capacidadPasajeros: number, autonomia: number, 
      potencia: number, estado: string, numPuertas: number, precioBase: number, id: string): Observable <VehiculoAllDetails> {
        return this.http.put<VehiculoAllDetails>(`${environment.apiBaseUrl}/admin/edit/vehiculo/${id}`, 
        {
          imagen: imagen,
          combustion: combustion,
          transmision: transmision,
          capacidadPasajeros: capacidadPasajeros,
          autonomia: autonomia,
          potencia:potencia,
          estado: estado,
          numPuertas: numPuertas,
          precioBase: precioBase,
        }, {
          headers: {
            'Authorization': `Bearer ${localStorage.getItem('token')}`
          }
        });
      }

    details(id: string): Observable<VehiculoAllDetails> {
      return this.http.get<VehiculoAllDetails>(`${environment.apiBaseUrl}/admin/vehiculo-details/${id}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      })
    }

    delete(id: string) {
      return this.http.delete(`${environment.apiBaseUrl}/admin/delete/vehiculo/${id}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
    }
}
