<?php 

	function get_additional( $add, $tipe ){
		$arr = [
			'datatables' => [ 
				'css' => [
					'<link href="'.base_url('assets/vendors/custom/datatables/datatables.bundle.css').'" rel="stylesheet" type="text/css" />' 
				],
				'js' => [
					'<script src="'.base_url('assets/vendors/custom/datatables/datatables.bundle.js').'" type="text/javascript"></script>',
					'<script src="'.base_url('assets/demo/custom/crud/datatables/advanced/row-grouping.js').'" type="text/javascript"></script>'
				]
			],
			'amchart' => [ 
				'css' => [
					'<link href="http://www.amcharts.com/lib/3/plugins/export/export.css" rel="stylesheet" type="text/css" />' 
				],
				'js' => [
					'<script src="//www.amcharts.com/lib/3/amcharts.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/serial.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/radar.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/pie.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/plugins/tools/polarScatter/polarScatter.min.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/plugins/animate/animate.min.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/plugins/export/export.min.js" type="text/javascript"></script>',
					'<script src="//www.amcharts.com/lib/3/themes/light.js" type="text/javascript"></script>',
					'<script src="'.base_url('assets/vendors/custom/amcharts/charts.js').'" type="text/javascript"></script>'
				]
			],

			'highcharts' => [ 
				'js' => [
					'<script src="'.base_url('assets/vendors/custom/highcharts/highcharts.js').'" type="text/javascript"></script>',
					'<script src="'.base_url('assets/vendors/custom/highcharts/exporting.js').'" type="text/javascript"></script>',
					'<script src="'.base_url('assets/vendors/custom/highcharts/export-data.js').'" type="text/javascript"></script>'
				]
			]
		];

		if($tipe == 'all'){
			$each = @$arr[ $add ];

			foreach ($each as $key) {
				foreach ($key as $value) {
					echo $value."\n";
				}
			}
		}else{
			$each = @$arr[ $add ][ $tipe ];
			if ( $each )
			{
				foreach ( $each as $key => $value ) {
					echo $value."\n";
				}
			}
		}
	}
	
?>