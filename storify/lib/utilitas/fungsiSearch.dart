List<Map<String, dynamic>> fungsisearch(List<Map<String, dynamic>> data, String keyword) {
  return data.where((item) => item['Nama_barang'].toLowerCase().contains(keyword.toLowerCase())).toList();
}