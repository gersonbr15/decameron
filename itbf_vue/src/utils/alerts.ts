import type { SweetAlertPosition } from "sweetalert2";
import Swal from "sweetalert2";

const defaultsToast = {
  position: "top-end" as SweetAlertPosition,
  timer: 3000,
  timerProgressBar: true,
  customClass: { timerProgressBar: "timerProgressBar", container: 'high-z-index' },
};

const defaultValues = {
  background: "rgb(var(--v-theme-surface))",
  color: "rgba(var(--v-theme-on-surface) !important;",
  customClass: {
    container: 'high-z-index'
  },
};

export function alertToast(params: any) {
  return new Promise((resolve, reject) => {
    Swal.fire({
      toast: true,

      // ----- Texts ----//
      titleText: params.titleText ?? null,
      title: params.title ?? null,
      text: params.text ?? null,

      // HTML: params.HTML ?? null,

      // ----- Icon ----//
      icon: params.icon ?? "info", // success || error || warning || info || question
      iconColor: params.iconColor ?? null,
      iconHtml: params.iconHtml ?? null,

      background: params.background ?? defaultValues.background,
      color: params.color ?? defaultValues.color,
      customClass: defaultsToast.customClass,

      // ----- Time ----//
      position: params.position ?? defaultsToast.position,
      timer: params.timer ?? defaultsToast.timer,
      timerProgressBar:
        params.timerProgressBar ?? defaultsToast.timerProgressBar,

      showConfirmButton: false,
      showCloseButton: true,
      didOpen: (toast) => {
        toast.addEventListener("mouseenter", Swal.stopTimer);
        toast.addEventListener("mouseleave", Swal.resumeTimer);
        toast.style.zIndex = "10000";
      },
    })
      .then((res) => {
        resolve(res);
      })
      .catch((err) => {
        reject(err);
      });
  });
}

export function alertConfirm(params: any) {
  return new Promise((resolve, reject) => {
    Swal.fire({
      toast: false,
      timer: params.timer ?? undefined,
      timerProgressBar: params.timerProgressBar ?? false,

      // ----- Texts ----//
      titleText: params.titleText ?? null,
      title: params.title ?? null,
      text: params.text ?? null,

      // HTML: params.HTML ?? null,
      footer: params.footer ?? null,

      // ----- Icon ----//
      icon: params.icon ?? "question", // success || error || warning || info || question
      iconColor: params.iconColor ?? null,
      iconHtml: params.iconHtml ?? null,

      // ----- HTML ----//
      backdrop: params.backdrop ?? true,

      // ----- Class ----//
      customClass: params.customClass ?? defaultValues.customClass,
      showClass: params.showClass ?? null,
      hideClass: params.hideClass ?? null,
      buttonsStyling: params.buttonsStyling ?? true,
      reverseButtons: params.reverseButtons ?? true, 

      // ----- Styles ----//
      background: params.background ?? defaultValues.background,
      width: params.width ?? null,
      padding: params.padding ?? null,
      color: params.color ?? defaultValues.color,

      // ----- Input ----//
      input: params.input ?? null, // text, email, password, number, tel, range, textarea, select, radio, checkbox, file, url

      // ----- Close ----//
      allowOutsideClick: params.allowOutsideClick ?? false,
      allowEscapeKey: params.allowEscapeKey ?? false,

      // ----- Confirm Button ----//
      showConfirmButton: params.showConfirmButton ?? true,
      confirmButtonText: params.confirmButtonText ?? "Si",
      confirmButtonColor: params.confirmButtonColor ?? "rgb(var(--v-theme-success))",
      confirmButtonAriaLabel: params.confirmButtonAriaLabel ?? null,

      // ----- Deny Button ----//
      showDenyButton: params.showDenyButton ?? false,
      denyButtonText: params.denyButtonText ?? "No",
      denyButtonColor: params.denyButtonColor ?? "rgb(var(--v-theme-error))",
      denyButtonAriaLabel: params.denyButtonAriaLabel ?? null,

      // ----- Cancel Button ----//
      showCancelButton: params.showCancelButton ?? false,
      cancelButtonColor: params.cancelButtonColor ?? "rgb(var(--v-theme-error))",
      cancelButtonText: params.cancelButtonText ?? "No",
      cancelButtonAriaLabel: params.cancelButtonAriaLabel ?? null,

      // ----- Cancel Button ----//
      showCloseButton: params.showCloseButton ?? false,
    })
      .then((res) => {
        resolve(res);
      })
      .catch((err) => {
        reject(err);
      });
  });
}

export function alertLoading(text: any = null) {
  return new Promise((resolve, reject) => {
    Swal.fire({
      html: `
      <div class="loadingAlert">
          <div class="loader"></div>
          <div class="text">${text || "Cargando información"}</div>
      </div>
      `,
      position: defaultsToast.position,
      background: defaultValues.background,
      color: defaultValues.color,
      showConfirmButton: false,
      showCloseButton: true,
      toast: true,
      icon: undefined,
    })
      .then((res) => {
        resolve(res);
      })
      .catch((err) => {
        reject(err);
      });
  });
}

export function alertClosed() {
  Swal.close();
}
