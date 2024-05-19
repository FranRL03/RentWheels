export interface ListAlquilerResponse {
    content:          Alquiler[];
    pageable:         Pageable;
    last:             boolean;
    totalPages:       number;
    totalElements:    number;
    size:             number;
    number:           number;
    sort:             Sort;
    first:            boolean;
    numberOfElements: number;
    empty:            boolean;
}

export interface Alquiler {
    id:            string;
    fechaInicio:   string;
    fechaFin:      string;
    origen:        string;
    destino:       string;
    enAlquiler:    boolean;
    cliente:       Cliente;
}

export interface Cliente {
    id:       string;
    username: string;
    avatar:   string;
    email:    string;
    telefono: string;
    pin:      string;
}

export interface Pageable {
    pageNumber: number;
    pageSize:   number;
    sort:       Sort;
    offset:     number;
    paged:      boolean;
    unpaged:    boolean;
}

export interface Sort {
    empty:    boolean;
    sorted:   boolean;
    unsorted: boolean;
}
