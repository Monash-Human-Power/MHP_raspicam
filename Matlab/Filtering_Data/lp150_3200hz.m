function y = lp150_3200hz(x)
%LP150_3200HZ Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 15-Mar-2018 10:26:34

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % Equiripple Lowpass filter designed using the FIRPM function.
    %
    % % All frequency values are in Hz.
    % Fs = 3200;  % Sampling Frequency
    %
    % Fpass = 150;             % Passband Frequency
    % Fstop = 170;             % Stopband Frequency
    % Dpass = 0.057501127785;  % Passband Ripple
    % Dstop = 0.0001;          % Stopband Attenuation
    % dens  = 20;              % Density Factor
    %
    % % Calculate the order from the parameters using FIRPMORD.
    % [N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
    %
    % % Calculate the coefficients using the FIRPM function.
    % b  = firpm(N, Fo, Ao, W, {dens});
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [3.51799179742971e-05 -4.90448320437375e-05 ...
        -8.5960618084541e-05 -0.000151001037605521 -0.000244313043834811 ...
        -0.000367940479834675 -0.000523514838363573 -0.000711270222668155 ...
        -0.000929416443228698 -0.00117382512477722 -0.00143780823972327 ...
        -0.00171218801817314 -0.00198548668604706 -0.00224442798852702 ...
        -0.00247453262540997 -0.00266099964753295 -0.00278961646014622 ...
        -0.00284787626882416 -0.00282597284651973 -0.00271782397840601 ...
        -0.0025217745965624 -0.00224121856370413 -0.0018847678380416 ...
        -0.00146624608080273 -0.00100402134617317 -0.000520208655406945 ...
        -3.9223310625238e-05 0.000413238559265264 0.000812552582287788 ...
        0.0011364286098659 0.00136669592467496 0.00149088099521707 ...
        0.00150315445076704 0.00140512696349816 0.00120591294741234 ...
        0.000921764375820648 0.000575035506968797 0.000192727644432269 ...
        -0.000195449775024552 -0.000559247752959686 -0.000870207162430252 ...
        -0.00110389027311123 -0.00124187652935082 -0.00127331653936906 ...
        -0.00119593817026274 -0.00101637845787037 -0.000749782790497003 ...
        -0.000418690115175485 -5.12641934435839e-05 0.000320946952028403 ...
        0.000665644078870026 0.000952502189610397 0.00115586515207911 ...
        0.00125693211625237 0.00124562091129749 0.00112159675831154 ...
        0.000894427213416313 0.000583051106506634 0.000214203014278235 ...
        -0.000179726501972893 -0.000563495965667715 -0.000902063153246016 ...
        -0.00116376292195579 -0.00132320966958424 -0.00136375580518897 ...
        -0.00127918722554534 -0.00107455487797515 -0.000765985928901012 ...
        -0.000379510000282462 5.10769374640666e-05 0.000487089522130214 ...
        0.000888371607025698 0.00121692666930609 0.00144047438975344 ...
        0.00153557736797964 0.00149004173285887 0.00130434779180901 ...
        0.000991966222513438 0.000578498158665593 9.96305160507087e-05 ...
        -0.000401876051995239 -0.000879903721622582 -0.0012892275099262 ...
        -0.00158966601179963 -0.00175001709536027 -0.00175119522923715 ...
        -0.00158839426087201 -0.00127194991317429 -0.000826853323836603 ...
        -0.000290859419384166 0.0002886274117783 0.000858685307401881 ...
        0.0013656364082706 0.00176004431631015 0.0020014517951166 ...
        0.00206245560403194 0.00193167372520362 0.00161532967873843 ...
        0.00113722162377394 0.000537066035798206 -0.000132710247121702 ...
        -0.000811459036722784 -0.00143573514243887 -0.00194514056296021 ...
        -0.00228808351674431 -0.00242689809813868 -0.00234185548122772 ...
        -0.00203356446481146 -0.00152364031182521 -0.000853338156871221 ...
        -8.036296201951e-05 0.000726001609581345 0.00149099725931752 ...
        0.00214122438359609 0.00261157332098432 0.00285162287749077 ...
        0.00283087384805308 0.00254229907175831 0.00200381214705417 ...
        0.00125746006664474 0.000366308565438796 -0.000590734911750924 ...
        -0.00152577925760259 -0.00234987648213515 -0.00298134329934824 ...
        -0.00335368768644965 -0.00342240541991842 -0.00316994704305565 ...
        -0.00260835729451559 -0.00177922190514858 -0.000750856911903188 ...
        0.0003871243918867 0.00153140798444278 0.00257419370870038 ...
        0.00341311785182206 0.00396108279607998 0.00415501465187806 ...
        0.00396270847822038 0.003387058667786 0.002467163817199 ...
        0.00127609716503777 -8.45877584507168e-05 -0.00149322597112146 ...
        -0.00281862680076193 -0.00393197885114401 -0.00471900890104565 ...
        -0.00509130076166217 -0.00499566298638558 -0.00442062129610356 ...
        -0.00339929510057355 -0.00200825741763737 -0.000362301730965605 ...
        0.0013945620807602 0.00310123213813776 0.00459375527528052 ...
        0.00572048800233336 0.00635680743532529 0.00641802315392011 ...
        0.00586918806660839 0.00473082429642782 0.00307979573614522 ...
        0.00104505266013961 -0.00120160685973331 -0.00345918551582531 ...
        -0.00551448839149675 -0.00716113873923587 -0.00821897403965372 ...
        -0.00855211421070943 -0.00808400555419142 -0.00680794979102711 ...
        -0.00479195253247011 -0.0021771413537246 0.000830422152758867 ...
        0.00397420277082621 0.00696698811296577 0.00951461109235994 ...
        0.0113417723812894 0.0122178806388572 0.0119807193740686 ...
        0.0105558478050044 0.0079698818624568 0.00435624456798834 ...
        -4.74829078963438e-05 -0.0049108111234574 -0.00982973837934982 ...
        -0.014353115017367 -0.0180142346127709 -0.0203654199893271 ...
        -0.0210130166562214 -0.0196501510810344 -0.0160846204306612 ...
        -0.0102596345461875 -0.00226557620080141 0.00765839866186534 ...
        0.0191333637532813 0.0316598822674947 0.0446463654387991 ...
        0.0574447183626041 0.0693908148626466 0.0798469997004068 ...
        0.0882435937322293 0.0941164184900282 0.0971376325485493 ...
        0.0971376325485493 0.0941164184900282 0.0882435937322293 ...
        0.0798469997004068 0.0693908148626466 0.0574447183626041 ...
        0.0446463654387991 0.0316598822674947 0.0191333637532813 ...
        0.00765839866186534 -0.00226557620080141 -0.0102596345461875 ...
        -0.0160846204306612 -0.0196501510810344 -0.0210130166562214 ...
        -0.0203654199893271 -0.0180142346127709 -0.014353115017367 ...
        -0.00982973837934982 -0.0049108111234574 -4.74829078963438e-05 ...
        0.00435624456798834 0.0079698818624568 0.0105558478050044 ...
        0.0119807193740686 0.0122178806388572 0.0113417723812894 ...
        0.00951461109235994 0.00696698811296577 0.00397420277082621 ...
        0.000830422152758867 -0.0021771413537246 -0.00479195253247011 ...
        -0.00680794979102711 -0.00808400555419142 -0.00855211421070943 ...
        -0.00821897403965372 -0.00716113873923587 -0.00551448839149675 ...
        -0.00345918551582531 -0.00120160685973331 0.00104505266013961 ...
        0.00307979573614522 0.00473082429642782 0.00586918806660839 ...
        0.00641802315392011 0.00635680743532529 0.00572048800233336 ...
        0.00459375527528052 0.00310123213813776 0.0013945620807602 ...
        -0.000362301730965605 -0.00200825741763737 -0.00339929510057355 ...
        -0.00442062129610356 -0.00499566298638558 -0.00509130076166217 ...
        -0.00471900890104565 -0.00393197885114401 -0.00281862680076193 ...
        -0.00149322597112146 -8.45877584507168e-05 0.00127609716503777 ...
        0.002467163817199 0.003387058667786 0.00396270847822038 ...
        0.00415501465187806 0.00396108279607998 0.00341311785182206 ...
        0.00257419370870038 0.00153140798444278 0.0003871243918867 ...
        -0.000750856911903188 -0.00177922190514858 -0.00260835729451559 ...
        -0.00316994704305565 -0.00342240541991842 -0.00335368768644965 ...
        -0.00298134329934824 -0.00234987648213515 -0.00152577925760259 ...
        -0.000590734911750924 0.000366308565438796 0.00125746006664474 ...
        0.00200381214705417 0.00254229907175831 0.00283087384805308 ...
        0.00285162287749077 0.00261157332098432 0.00214122438359609 ...
        0.00149099725931752 0.000726001609581345 -8.036296201951e-05 ...
        -0.000853338156871221 -0.00152364031182521 -0.00203356446481146 ...
        -0.00234185548122772 -0.00242689809813868 -0.00228808351674431 ...
        -0.00194514056296021 -0.00143573514243887 -0.000811459036722784 ...
        -0.000132710247121702 0.000537066035798206 0.00113722162377394 ...
        0.00161532967873843 0.00193167372520362 0.00206245560403194 ...
        0.0020014517951166 0.00176004431631015 0.0013656364082706 ...
        0.000858685307401881 0.0002886274117783 -0.000290859419384166 ...
        -0.000826853323836603 -0.00127194991317429 -0.00158839426087201 ...
        -0.00175119522923715 -0.00175001709536027 -0.00158966601179963 ...
        -0.0012892275099262 -0.000879903721622582 -0.000401876051995239 ...
        9.96305160507087e-05 0.000578498158665593 0.000991966222513438 ...
        0.00130434779180901 0.00149004173285887 0.00153557736797964 ...
        0.00144047438975344 0.00121692666930609 0.000888371607025698 ...
        0.000487089522130214 5.10769374640666e-05 -0.000379510000282462 ...
        -0.000765985928901012 -0.00107455487797515 -0.00127918722554534 ...
        -0.00136375580518897 -0.00132320966958424 -0.00116376292195579 ...
        -0.000902063153246016 -0.000563495965667715 -0.000179726501972893 ...
        0.000214203014278235 0.000583051106506634 0.000894427213416313 ...
        0.00112159675831154 0.00124562091129749 0.00125693211625237 ...
        0.00115586515207911 0.000952502189610397 0.000665644078870026 ...
        0.000320946952028403 -5.12641934435839e-05 -0.000418690115175485 ...
        -0.000749782790497003 -0.00101637845787037 -0.00119593817026274 ...
        -0.00127331653936906 -0.00124187652935082 -0.00110389027311123 ...
        -0.000870207162430252 -0.000559247752959686 -0.000195449775024552 ...
        0.000192727644432269 0.000575035506968797 0.000921764375820648 ...
        0.00120591294741234 0.00140512696349816 0.00150315445076704 ...
        0.00149088099521707 0.00136669592467496 0.0011364286098659 ...
        0.000812552582287788 0.000413238559265264 -3.9223310625238e-05 ...
        -0.000520208655406945 -0.00100402134617317 -0.00146624608080273 ...
        -0.0018847678380416 -0.00224121856370413 -0.0025217745965624 ...
        -0.00271782397840601 -0.00282597284651973 -0.00284787626882416 ...
        -0.00278961646014622 -0.00266099964753295 -0.00247453262540997 ...
        -0.00224442798852702 -0.00198548668604706 -0.00171218801817314 ...
        -0.00143780823972327 -0.00117382512477722 -0.000929416443228698 ...
        -0.000711270222668155 -0.000523514838363573 -0.000367940479834675 ...
        -0.000244313043834811 -0.000151001037605521 -8.5960618084541e-05 ...
        -4.90448320437375e-05 3.51799179742971e-05]);
end

y = step(Hd,double(x));


% [EOF]
