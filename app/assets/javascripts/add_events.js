// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//root = exports ? this

function testFunction() {
  

	var minicalendar = jQuery('<div class="mini-calendar"></div>');
	var table = jQuery('<table></table>');
	var tr1 = jQuery('<tr></tr>');
	var th1 = jQuery('<th></th>');
	var leftbutton = jQuery('<button type ="button" onclick="testFunction()">le</button>');
	jQuery($(th1).append(leftbutton));
	//var th2 = jQuery('<th></th>');
	//var th3 = jQuery('<th></th>');
	var th4 = jQuery('<th colspan="5">Month</th>');
	//var th5 = jQuery('<th></th>');
	//var th6 = jQuery('<th></th>');

	var th7 = jQuery('<th></th>');
	var rightbutton = jQuery('<button type ="button" onclick="testFunction()">ri</button>');
	jQuery($(th7).append(rightbutton));
	
	jQuery($(tr1).append(th1, th4, th7));
	//jQuery($(tr1).append(th1, th2, th3, th4, th5, th6, th7));

	var tr2 = jQuery('<tr></tr>');
	var tdday1 = jQuery('<td class="days">S</td>');
	var tdday2 = jQuery('<td class="days">M</td>');
	var tdday3 = jQuery('<td class="days">T</td>');
	var tdday4 = jQuery('<td class="days">W</td>');
	var tdday5 = jQuery('<td class="days">H</td>');
	var tdday6 = jQuery('<td class="days">F</td>');
	var tdday7 = jQuery('<td class="days">S</td>');
	jQuery($(tr2).append(tdday1, tdday2, tdday3, tdday4, tdday5, tdday6, tdday7));

	var tr3 = jQuery('<tr></tr>');
	var td1 = jQuery('<td onclick="testFunction()">1</td>');
	var td2 = jQuery('<td>2</td>');
	var td3 = jQuery('<td>3</td>');
	var td4 = jQuery('<td>4</td>');
	var td5 = jQuery('<td>5</td>');
	var td6 = jQuery('<td>6</td>');
	var td7 = jQuery('<td>7</td>');
	jQuery($(tr3).append(td1, td2, td3, td4, td5, td6, td7));

	var tr4 = jQuery('<tr></tr>');
	var td8 = jQuery('<td>8</td>');
	var td9 = jQuery('<td>9</td>');
	var td10 = jQuery('<td>10</td>');
	var td11 = jQuery('<td>11</td>');
	var td12 = jQuery('<td>12</td>');
	var td13 = jQuery('<td>13</td>');
	var td14 = jQuery('<td>14</td>');
	jQuery($(tr4).append(td8, td9, td10, td11, td12, td13, td14));

	var tr5 = jQuery('<tr></tr>');
	var td15 = jQuery('<td>15</td>');
	var td16 = jQuery('<td>16</td>');
	var td17 = jQuery('<td>17</td>');
	var td18 = jQuery('<td>18</td>');
	var td19 = jQuery('<td>19</td>');
	var td20 = jQuery('<td>20</td>');
	var td21 = jQuery('<td>21</td>');
	jQuery($(tr5).append(td15, td16, td17, td18, td19, td20, td21));

	var tr6 = jQuery('<tr></tr>');
	var td22 = jQuery('<td>22</td>');
	var td23 = jQuery('<td>23</td>');
	var td24 = jQuery('<td>24</td>');
	var td25 = jQuery('<td>25</td>');
	var td26 = jQuery('<td>26</td>');
	var td27 = jQuery('<td>27</td>');
	var td28 = jQuery('<td>28</td>');
	jQuery($(tr6).append(td22, td23, td24, td25, td26, td27, td28));

	var tr7 = jQuery('<tr></tr>');
	var td29 = jQuery('<td>29</td>');
	var td30 = jQuery('<td>30</td>');
	var td31 = jQuery('<td>31</td>');
	var td32 = jQuery('<td>32</td>');
	var td33 = jQuery('<td>33</td>');
	var td34 = jQuery('<td>34</td>');
	var td35 = jQuery('<td>35</td>');
	jQuery($(tr7).append(td29, td30, td31, td32, td33, td34, td35));

	jQuery($(table).append(tr1, tr2, tr3, tr4, tr5, tr6, tr7));

	var label = jQuery('<label for="startdate1">Start Date</label>');
	var input = jQuery('<input type="text" class="form-control input-lg" id="startdate1">');
	jQuery($(minicalendar).append(label, table, input));

	jQuery($(".test").append(minicalendar));
}

/*
<div class="mini-calendar">
		<table>
			<tr>
		    <th><button type ="button" onclick="testFunction()">le</button></th>
		    <th colspan="5">Month</th>
		    <th><button type ="button" onclick="testFunction()">ri</button></th>
			</tr>
			<tr>
		    <td class = "days">S</td>
		    <td class = "days">M</td>
		    <td class = "days">T</td>
		    <td class = "days">W</td>
		    <td class = "days">H</th>
		    <td class = "days">F</td>
		    <td class = "days">S</td>
			</tr>
			<tr>
				<td>11</td>
				<td>12</td>
				<td>13</td>
				<td>14</td>
				<td>15</td>
				<td>16</td>
				<td>17</td>
			</tr>
			<tr>
				<td>21</td>
				<td>22</td>
				<td>23</td>
				<td>24</td>
				<td>25</td>
				<td>26</td>
				<td>27</td>
			</tr>
			<tr>
				<td>31</td>
				<td>32</td>
				<td>33</td>
				<td>34</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>
			</tr>
		</table>
  </div>
*/