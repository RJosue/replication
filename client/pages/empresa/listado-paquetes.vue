<template>
  <div>
    <nav aria-label="breadcrumb" class="p-2">
      <ol class="breadcrumb">
        <li class="breadcrumb-item">Main</li>
        <li class="breadcrumb-item active" aria-current="page">
          Listado de Paquetes
        </li>
      </ol>
    </nav>
    <div id="app">
      <v-app id="inspire">
        <v-card-title>
          Listado de paquetes
          <v-spacer></v-spacer>
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Buscador"
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>
        <v-data-table
          :headers="headers"
          :items="paquetes"
          :search="search"
          class="elevation-1 m-3"
        >
          <template v-slot:[`item.name_status`]="{ item }">
            <v-chip
              filter
              label
              pill
              :color="getColor(item.status_paquete)"
              dark
            >
              {{ item.name_status }}
            </v-chip>
          </template>
          <template v-slot:[`item.actions`]="{ item }">
            <v-icon
              v-show="item.status_paquete == 2"
              color="green"
              @click="sendFactura(item.id_paquete)"
            >
              mdi-check
            </v-icon>
            <v-icon
              v-show="item.status_paquete != 3"
              color="primary"
              @click="editarPaquete(item.id_paquete)"
            >
              mdi-pencil
            </v-icon>
            <v-icon color="red" @click="deletePaquete(item.id_paquete)">
              mdi-delete
            </v-icon>
          </template>
        </v-data-table>
      </v-app>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";
export default {
  layout: "empresa",
  data() {
    return {
      search: "",
      totalItems: 0,
      headers: [
        {
          text: "id",
          align: "center",
          value: "id_paquete",
        },
        {
          text: "N° Tracking",
          align: "center",
          value: "number_tracking",
        },
        { text: "Cliente", align: "center", value: "full_name" },
        { text: "Tipo de cuenta", align: "center", value: "name_tipo_cuenta" },
        { text: "LLegada", align: "center", value: "fechaInit" },
        { text: "Retiro", align: "center", value: "fechaFin" },
        { text: "Estado", align: "center", value: "name_status" },
        { text: "Costo", align: "center", value: "costo_total" },
        { text: "Sucursal", align: "center", value: "name_sucursal" },
        { text: "Almacen", align: "center", value: "name_almacen" },
        {
          text: "Acciones",
          align: "center",
          value: "actions",
          sortable: false,
        },
      ],
      paquetes: [],
    };
  },
  async fetch() {
    let responsePaquetes = await axios.get(
      `${process.env.baseURL}/api/inventory/allPaquetes`,
      {
        headers: {
          "Set-Cookie": document.cookie,
        },
      }
    );
    this.paquetes = responsePaquetes.data.data.map((p) => {
      return {
        ...p,
        costo_total: `$ ${p.costo_total}`,
        fechaInit: new Date(p.fecha_llegada).toLocaleDateString(),
        fechaFin:
          p.fecha_retiro == null || p.fecha_retiro == ""
            ? ""
            : new Date(p.fecha_retiro).toLocaleDateString(),
      };
    });
  },
  methods: {
    getColor(status) {
      if (status == 1) return "red";
      else if (status == 2) return "green";
      else return "black";
    },
    async editarPaquete(id_paquete) {
      await this.$router.push(
        `/empresa/actualizar-paquete?id=${btoa(id_paquete)}`
      );
    },
    async sendFactura(id_paquete) {
      await this.$router.push(
        `/empresa/factura-paquete?id=${btoa(id_paquete)}`
      );
    },
    deletePaquete(id_paquete) {
      Swal.fire({
        title: "¿Seguro de desea eliminar este paquete?",
        text: "Esta acción no se puede revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si, Eliminar!",
        cancelButtonText: "Cancelar",
      }).then(async (result) => {
        if (result.isConfirmed) {
          let responseDeletePaquete = await axios.delete(
            `${process.env.baseURL}/api/inventory/paquete`,
            {
              headers: {
                "Set-Cookie": document.cookie,
              },
              data: { id_paquete },
            }
          );
          let getIdPaquete = this.paquetes.findIndex(
            (p) => p.id_paquete == id_paquete
          );
          if (responseDeletePaquete.data.success) {
            this.paquetes.splice(getIdPaquete, 1);
            Swal.fire({
              title: "Paquete eliminado con éxito",
              icon: "success",
            });
          } else {
            Swal.fire({
              title: "Ocurrio un error al eliminar el paquete",
              icon: "error",
            });
          }
        }
      });
    },
  },
};
</script>

<style>
.v-application--wrap {
  flex: 1 1 auto;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  display: flex;
  flex-direction: column;
  min-height: 80vh !important;
  max-width: 100%;
  position: relative;
}
</style>
