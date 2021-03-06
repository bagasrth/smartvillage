{set title="Manajemen Agama"}
{$user = Yii::$app->session->get('user', false)}
{if $isAdmin}
    <a onclick="loadModal(this)" target="master/agama/form" class="btn btn-primary" title="Tambah Data"><i
                class="glyphicon glyphicon-plus"></i> Tambah Data</a>
{/if}
<table id="user-table" class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>No</th>
        <th>Agama</th>
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
                    <a onclick="loadModal(this)" target="master/agama/form" data="id={$item->id}"
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
        ajaxTransfer('master/agama', { }, '#main-content');
    }

    function deleteData(id) {
        modalConfirm('Konfirmasi', 'Apakah anda yakin akan menghapus data?', function () {
            ajaxTransfer('master/agama/delete', { id: id }, '#modal-output');
        });
    }
    dataTables('#user-table');
</script>