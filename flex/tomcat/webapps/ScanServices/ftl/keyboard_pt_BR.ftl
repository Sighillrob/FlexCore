<div id="keyboard">
  
  <#macro hdrbtn label script class>
    <table class="${class}" cellspacing="0" onclick='${script}'><tr><td class="btn_left"></td><td class="btn_middle">${label}</td><td class="btn_right"></td></tr></table>
  </#macro>	
	
	<div id="keyboard_heading">
    <p id="keyboard_title">${EIP_Keyboard}</p>
    <div id="keyboard_btns">
      <@hdrbtn "${EIP_Save}" ";confirmValue();" "actionBtn" />
      <@hdrbtn "${EIP_Cancel}" "closeKeyboard()" "regularBtn"/>
    </div>
	</div>
		
	<div id="kdbinput_container">
  	<label for="kbdinput" id="kbdinput_label"></label>
  	<div id="kbinputwrapper"><input type="text" id="kbdinput" size="255" class="xrx:keyboardtext"/></div>
  	<div id="cleartxt" onclick="clearText();"><img src="${EIP_RealPath}/images/DS/keyboard/clear.png" /></div>
  </div>

  <table class="keyrow" cellspacing="0" style="clear:both">
      <tr>
        <td id="key1" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">"</div>
            <div class="divLetterInactive">'</div>
        </td>        
        <td id="key2" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">!</div>
            <div class="divLetterInactive">1</div>
            <div class="divSpecialInactive">¹</div>
        </td>        
        <td id="key3" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">@</div>
            <div class="divLetterInactive">2</div>
            <div class="divSpecialInactive">²</div>
        </td>        
        <td id="key4" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">#</div>
            <div class="divLetterInactive">3</div>
            <div class="divSpecialInactive">³</div>
        </td>
        <td id="key5" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">$</div>
            <div class="divLetterInactive">4</div>
            <div class="divSpecialInactive">£</div>
        </td>
        <td id="key6" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">%</div>
            <div class="divLetterInactive">5</div>
            <div class="divSpecialInactive">¢</div>
        </td>
        <td id="key7" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">¨</div>
            <div class="divLetterInactive">6</div>
            <div class="divSpecialInactive">¬</div>
        </td>
        <td id="key8" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">&</div>
            <div class="divLetterInactive">7</div>
        </td>
        <td id="key9" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">*</div>
            <div class="divLetterInactive">8</div>
        </td>           
        <td id="key10" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">(</div>
            <div class="divLetterInactive">9</div>
        </td>
        <td id="key11" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">)</div>
            <div class="divLetterInactive">0</div>
        </td>
        <td id="key12" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">_</div>
            <div class="divLetterInactive">-</div>
        </td>
        <td id="key13" class="key" onclick="typeLetter(this.id)">
            <div class="divCapitalInactive">+</div>
            <div class="divLetterInactive">=</div>
            <div class="divSpecialInactive">§</div>
        </td>
        <td class="bsp" id="bsp" onclick="erase()"> <img src="${EIP_RealPath}/images/DS/keyboard/bsp.png" /></td>
      </tr>
  </table>
	
	<table class="keyrow" cellspacing="0">
	    <tr>
            <td class="tab" id="tab"> 
              <div class="SpecialLabel">Tab</div>
              <img src="${EIP_RealPath}/images/DS/keyboard/tab.png" />
            </td>
	        <td id="key14" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">q</div>
                <div class="divCapitalInactive">Q</div>
                <div class="divSpecialInactive">/</div>
            </td>
            
            <td id="key15" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">w</div>
                <div class="divCapitalInactive">W</div>
                <div class="divSpecialInactive">?</div>
            </td>
            
            <td id="key16" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">e</div>
                <div class="divCapitalInactive">E</div>
                <div class="divSpecialInactive">°</div>
            </td>
            
            <td id="key17" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">r</div>
                <div class="divCapitalInactive">R</div>
                <div class="divSpecialInactive">à</div>
            </td>

            <td id="key18" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">t</div>
                <div class="divCapitalInactive">T</div>
                <div class="divSpecialInactive">á</div>
            </td>
            <td id="key19" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">y</div>
                <div class="divCapitalInactive">Y</div>
                <div class="divSpecialInactive">â</div>
            </td>
            <td id="key20" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">u</div>
                <div class="divCapitalInactive">U</div>
                <div class="divSpecialInactive">ã</div>
            </td>
            <td id="key21" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">i</div>
                <div class="divCapitalInactive">I</div>
                <div class="divSpecialInactive">À</div>
            </td>
            <td id="key22" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">o</div>
                <div class="divCapitalInactive">O</div>
                <div class="divSpecialInactive">Á</div>
            </td>           
            <td id="key23" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterActive">p</div>
                <div class="divCapitalInactive">P</div>
                <div class="divSpecialInactive">Â</div>
            </td>
            <td id="key24" class="key" onclick="typeLetter(this.id)">     
                <div class="divLetterActive">'</div>
                <div class="divCapitalInactive">`</div>
                <div class="divSpecialInactive">Ã</div>
            </td>
            <td id="key25" class="key" onclick="typeLetter(this.id)">
                <div class="divSpecialInactive">ª</div>
                <div class="divLetterActive">[</div>
                <div class="divCapitalInactive">{</div>
            </td>        
            <td id="key26" class="key" onclick="typeLetter(this.id)">
                <div class="divSpecialInactive">º</div>
                <div class="divLetterActive">]</div>
                <div class="divCapitalInactive">}</div>
            </td> 
	    </tr>
	</table>
	
	<table class="keyrow" cellspacing="0">
        <tr>
            <td class="capsLock" id="capsLock" onclick='capsLock()'>
              <div class="SpecialLabel">Caps Lock</div>
              <img src="${EIP_RealPath}/images/DS/keyboard/capsLock.png" />
            </td>
            <td id="key27" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">a</div>
                <div class="divCapitalInactive">A</div>
                <div class="divSpecialInactive">é</div>
            </td>
            <td id="key28" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">s</div>
                <div class="divCapitalInactive">S</div>
                <div class="divSpecialInactive">ê</div>
            </td>
            <td id="key29" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">d</div>
                <div class="divCapitalInactive">D</div>
                <div class="divSpecialInactive">É</div>
            </td>
            <td id="key30" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">f</div>
                <div class="divCapitalInactive">F</div>
                <div class="divSpecialInactive">Ê</div>
            </td>
            <td id="key31" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">g</div>
                <div class="divCapitalInactive">G</div>
                <div class="divSpecialInactive">í</div>
            </td>
            <td id="key32" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">h</div>
                <div class="divCapitalInactive">H</div>
                <div class="divSpecialInactive">Í</div>
            </td>

            <td id="key33" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">j</div>
                <div class="divCapitalInactive">J</div>
                <div class="divSpecialInactive">ó</div>
            </td>
            <td id="key34" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">k</div>
                <div class="divCapitalInactive">K</div>
                <div class="divSpecialInactive">ô</div>
            </td>
            <td id="key35" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">l</div>
                <div class="divCapitalInactive">L</div>
                <div class="divSpecialInactive">õ</div>
            </td>
            <td id="key36" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">ç</div>
                <div class="divCapitalInactive">Ç</div>
                <div class="divSpecialInactive">Ó</div>
            </td>
            <td id="key37" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">^</div>
                <div class="divCapitalInactive">~</div>
                <div class="divSpecialInactive">Ô</div>
            </td>            
        </tr>
	</table>

	
	<table class="keyrow" cellspacing="0">
        <tr>
            <td class="shiftLeft" id="shiftLeft" onclick="setShift()"> 
              <div class="SpecialLabel">Shift</div>
              <img src="${EIP_RealPath}/images/DS/keyboard/shift.png" />
            </td>
            <td id="key38" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">z</div>
                <div class="divCapitalInactive">Z</div>
                <div class="divSpecialInactive">Õ</div>
            </td>
            <td id="key39" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">x</div>
                <div class="divCapitalInactive">X</div>
                <div class="divSpecialInactive">ú</div>
            </td>
            <td id="key40" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">c</div>
                <div class="divCapitalInactive">C</div>
                <div class="divSpecialInactive">₢</div>
            </td>
            <td id="key41" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">v</div>
                <div class="divCapitalInactive">V</div>
                <div class="divSpecialInactive">ü</div>
            </td>
            <td id="key42" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">b</div>
                <div class="divCapitalInactive">B</div>
                <div class="divSpecialInactive">Ú</div>
            </td>
            <td id="key43" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">n</div>
                <div class="divCapitalInactive">N</div>
                <div class="divSpecialInactive">Ü</div>
            </td>
            <td id="key44" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">m</div>
                <div class="divCapitalInactive">M</div>
                <div class="divSpecialInactive">€</div>
            </td>
            <td id="key45" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">,</div>
                <div class="divCapitalInactive"><</div>
                <div class="divSpecialInactive">«</div>
            </td>
            <td id="key46" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">.</div>
                <div class="divCapitalInactive">></div>
                <div class="divSpecialInactive">»</div>
            </td>
            <td id="key47" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">;</div>
                <div class="divCapitalInactive">:</div>
            </td>
            <td id="key48" class="key" onclick="typeLetter(this.id)">
                <div class="divLetterInactive">/</div>
                <div class="divCapitalInactive">?</div>
            </td>
            <td class="shiftRight" id="shiftRight" onclick="setShift()"> 
              <div class="SpecialLabel">Shift</div>
              <img src="${EIP_RealPath}/images/DS/keyboard/shift.png" />
            </td>

        </tr>
	</table>
	
	<table class="keyrow" cellspacing="0">
	    <tr>
          <td class="special" id="special" onclick='setAltGr()'>Alt</td>
          <td class="number" id="number" onclick='setNumber()' style="display:none">Num</td>
	        <td id="space" class="space" onclick="typeSpace()"> </td>
          <td class="special" id="moveRight"> 
            <img src="${EIP_RealPath}/images/DS/keyboard/left.png" />
          </td>            
          <td class="special" id="moveLeft">
            <img src="${EIP_RealPath}/images/DS/keyboard/right.png" />
          </td> 
	    </tr>
	</table>
</div>
