
import axios from "axios";


const baseURL = `http://127.0.0.1:8000/api`;

const config = ref<object>({
    baseURL,
});

const axiosIns: any = axios.create(config.value);



axiosIns.interceptors.response.use(
    async (response: any) => {
        return Promise.resolve({
            status: response.status,
            data: response.data
        });
    },
    async (error: any) => {
        return Promise.reject({
            status: error.response.status,
            data: error.response.data
        });
    }
);

export default axiosIns;
