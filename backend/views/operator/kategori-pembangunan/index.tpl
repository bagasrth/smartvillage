{set title="Manajemen Kategori Pembangunan"}
{$user = Yii::$app->session->get('user', false)}
    <a onclick="loadModal(this)" target="operator/kategori-pembangunan/form" class="btn btn-primary" title="Tambah Data"><i
                class="glyphicon glyphicon-plus"></i> Tambah Data</a>
<table id="user-table" class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>No</th>
        <th>Kategori Pembangunan</th>
        <th>Opsi</th>
    </tr>
    </thead>
    <tbody>
    {$nomor = 1}
    {foreach $data as $item}
        <tr>
            <td>{$nomor++}</td>
            <td>{$item->nama}</td>

            <td class="center nowrap">
                <a onclick="loadModal(this)" target="operator/kategori-pembangunan/form" data="id={$item->id}"
                   class="btn btn-primary btn-xs glyphicon glyphicon-pencil" title="Ubah Data"></a>
                <a onclick="deleteData({$item->id})" class="btn btn-danger btn-xs glyphicon glyphicon-trash"
                   title="Hapus Data"></a>
            </td>
        </tr>
    {/foreach}
    </tbody>
</table>
<script>
    function reloadData() {
        ajaxTransfer('operator/kategori-pembangunan', { }, '#main-content');
    }

    function deleteData(id) {
        modalConfirm('Konfirmasi', 'Apakah anda yakin akan menghapus data?', function () {
            ajaxTransfer('operator/kategori-pembangunan/delete', { id: id }, '#modal-output');
        });
    }
    dataTables('#user-table');
</script>