$path=D:\iManage\IDOL\Indexer\"WorkSite Ingestion Server"\"WorkSite Ingestion Server.cfg"

if (Test-Path $path) {
    sls '^ACIPort=' $path -ca
}