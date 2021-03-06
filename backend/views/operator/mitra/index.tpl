{set title="Manajemen Mitra"}
{$user = Yii::$app->session->get('user', false)}
<a onclick="loadModal(this)" target="operator/mitra/form" class="btn btn-primary" title="Tambah Data"><i
            class="glyphicon glyphicon-plus"></i> Tambah Data</a>
<table id="user-table" class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>No</th>
        <th>Nama Mitra</th>
        <th>Alamat</th>
        <th>No Telp</th>
        <th>Email</th>
        <th>Opsi</th>
    </tr>
    </thead>
    <tbody>
    {$nomor = 1}
    {foreach $data as $item}
        <tr>
            <td>{$nomor++}</td>
            <td>{$item->nama_mitra}</td>
            <td>{$item->alamat}</td>
            <td>{$item->no_telp}</td>
            <td>{$item->email}</td>
            <td class="center nowrap">
                <a onclick="loadModal(this)" target="operator/mitra/form" data="id={$item->id}"
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
        ajaxTransfer('operator/mitra', { }, '#main-content');
    }

    function deleteData(id) {
        modalConfirm('Konfirmasi', 'Apakah anda yakin akan menghapus data?', function () {
            ajaxTransfer('operator/mitra/delete', { id: id }, '#modal-output');
        });
    }
    dataTables('#user-table');
</script>