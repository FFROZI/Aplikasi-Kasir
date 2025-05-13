CREATE TABLE `users` (
  `id` int PRIMARY KEY,
  `name` varchhar,
  `email` varchar(255),
  `password` varchar(255),
  `foto` varchar(255),
  `level` tinyint,
  `remember_token` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `kategori` (
  `id_kategori` int PRIMARY KEY,
  `nama_kategori` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `produk` (
  `id_produk` int PRIMARY KEY,
  `id_kategori` int,
  `nama_produk` varchar(255),
  `merk` varchar(255),
  `harga_beli` int,
  `diskon` int,
  `harga_jual` int,
  `stok` int,
  `creted_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `member` (
  `id_member` int PRIMARY KEY,
  `kode_member` varchar(255),
  `nama` varchar(255),
  `alamat` text,
  `telepon` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `supplier` (
  `id_supplier` int PRIMARY KEY,
  `nama` varchar(255),
  `alamat` text,
  `telepon` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int PRIMARY KEY,
  `deskripsi` text,
  `nominal` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `pembelian` (
  `id_pembelian` int PRIMARY KEY,
  `id_supplier` int,
  `total_item` int,
  `total_harga` int,
  `diskon` int,
  `bayar` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int PRIMARY KEY,
  `id_pembelian` int,
  `id_produk` int,
  `harga_beli` int,
  `jumlah` int,
  `subtotal` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `penjualan` (
  `id_penjualan` int PRIMARY KEY,
  `id_member` int,
  `total_item` int,
  `total_harga` int,
  `diskon` int,
  `bayar` int,
  `diterima` int,
  `id_user` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `penjualan_detail` (
  `id_penjualan_detail` int PRIMARY KEY,
  `id_penjualan` int,
  `id_produk` int,
  `harga_jual` int,
  `jumlah` int,
  `diskon` int,
  `subtotal` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `setting` (
  `id_setting` int PRIMARY KEY,
  `nama_perusahaan` varchar(255),
  `alamat` text,
  `telepon` varchar(255),
  `path_logo` varchar(255),
  `tipe_nota` tinyint,
  `created_at` timestamp,
  `update_at` timestamp
);

ALTER TABLE `produk` ADD FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

ALTER TABLE `pembelian` ADD FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

ALTER TABLE `pembelian_detail` ADD FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`);

ALTER TABLE `pembelian_detail` ADD FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

ALTER TABLE `penjualan` ADD FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`);

ALTER TABLE `penjualan_detail` ADD FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`);

ALTER TABLE `penjualan_detail` ADD FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

ALTER TABLE `produk` ADD FOREIGN KEY (`stok`) REFERENCES `produk` (`creted_at`);
