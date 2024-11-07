
%%system matrix Ybus%%
Yb = inv(z1);
YbusT = zeros(3 * N, 3 * N);
%% diagonal term%%
for s = 1:1:N
    for j = 1:1:N
        if s == j
            if bus_type(s) == 1
                h = 3 * s - 2;
                for l = 1:1:3
                    g = 3 * s - 2;
                    for ff = 1:1:3
                        YbusT(h, g) = YcrfT(l, ff);
                        g = g + 1;
                    end
                    h = h + 1;
                end
                for nb = 1:1:NBranch
                    if line_start_bus(nb) == s || line_end_bus(nb) == s
                        l = 1;
                        
                        for k = 3 * s - 2:1:3 * s
                            m = 1;
                            for q = 3 * s - 2:1:3 * s
                                YbusT(k, q) = YbusT(k, q) + (1 / line_length(nb)) * Yb(l, m);
                                m = m + 1;
                            end
                            l = l + 1;
                        end
                    end
                end
             
            else if bus_type(s) == 2
                for nb = 1:1:NBranch
                    if line_start_bus(nb) == s || line_end_bus(nb) == s
                        l = 1;
                        
                        for k = 3 * s - 2:1:3 * s
                            m = 1;
                            for q = 3 * s - 2:1:3 * s
                                YbusT(k, q) = YbusT(k, q) + (1 / line_length(nb)) * Yb(l, m);
                                m = m + 1;
                            end
                            l = l + 1;
                        end
                    end
                end
            else bus_type(s) == 3
             
                h = 3 * s - 2;
                for l = 1:1:3
                    g = 3 * s - 2;
                    for ff = 1:1:3
                        YbusT(h, g) = Yat(l, ff);
                        g = g + 1;
                    end
                    h = h + 1;
                end
                for nb = 1:1:NBranch
                    if line_start_bus(nb) == s || line_end_bus(nb) == s
                        l = 1;
                        for k = 3 * s - 2:1:3 * s
                            m = 1;
                            for q = 3 * s - 2:1:3 * s
                                YbusT(k, q) = YbusT(k, q) + (1 / line_length(nb)) * Yb(l, m);
                                m = m + 1;
                            end
                            l = l + 1;
                        end
                    end
                end
            end
        end
        end
    end
end

%% off-diagonal term%%
for s=1:1:N
    for j=1:1:N
        
    if s ~= j
        for nb = 1:1:NBranch
            if line_start_bus(nb) == s & line_end_bus(nb) ==j||line_start_bus(nb) == j & line_end_bus(nb) ==s
                l = 1;
%                 if i == 1
%                     disp(line_end_bus(nb))
%                 end
                for k = 3 * s - 2:1:3 * s
                    m = 1;
                    for q = 3 * j - 2:1:3 * j
                        YbusT(k, q) = YbusT(k, q) - (1 / line_length(nb)) * Yb(l, m);
                        m = m + 1;
                    end
                    l = l + 1;
                end
            end
        end
    end
    
    end
end
y_realT= real(YbusT);
y_imgT= imag(YbusT);