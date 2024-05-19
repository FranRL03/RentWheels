export interface AlquilerDetails {
    id:             string;
    precio:         number;
    kilometrosAnos: number;
    fechaCreacion:  string;
    fechaInicio:    string;
    fechaFin:       string;
    origen:         string;
    destino:        string;
    enAlquiler:     boolean;
    vehiculo:       Vehiculo;
    cliente:        Cliente;
}

export interface Cliente {
    id:       string;
    username: string;
    avatar:   string;
    email:    string;
    telefono: string;
    pin:      string;
}

export interface Vehiculo {
    id:                 string;
    combustion:         string;
    modelo:             Modelo;
    imagen:             string;
    transmision:        string;
    capacidadPasajeros: number;
    autonomia:          number;
    potencia:           number;
    estado:             string;
    numPuertas:         number;
    disponible:         boolean;
    precioBase:         number;
}

export interface Modelo {
    id:     string;
    modelo: string;
    logo:   string;
}
