
%%system matrix Ybus%%
Yb = inv(z1);
YbusM = zeros(3 * N_M, 3 * N_M);
%% diagonal term%%
for s = 1:1:N_M
    for j = 1:1:N_M
        if (s == j)
            if (bus_type_M(s) == 1)
                h = 3 * s - 2;
                for l = 1:1:3
                    g = 3 * s - 2;
                    for f1 = 1:1:3
                        YbusM(h, g) = YcrfM(l, f1);
                        g = g + 1;
                    end
                    h = h + 1;
                end
                for nb = 1:1:NBranch_M
                    if (line_start_bus_M(nb) == s || line_end_bus_M(nb) == s)
                        l = 1;
                        
                        for k = 3 * s - 2:1:3 * s
                            m = 1;
                            for q = 3 * s - 2:1:3 * s
                                YbusM(k, q) = YbusM(k, q) + (1 / line_length_M(nb)) * Yb(l, m);
                                m = m + 1;
                            end
                            l = l + 1;
                        end
                    end
                end
             
            else if (bus_type_M(s) == 2)
                for nb = 1:1:NBranch_M
                    if (line_start_bus_M(nb) == s || line_end_bus_M(nb) == s)
                        l = 1;
                        
                        for k = 3 * s - 2:1:3 * s
                            m = 1;
                            for q = 3 * s - 2:1:3 * s
                                YbusM(k, q) = YbusM(k, q) + (1 / line_length_M(nb)) * Yb(l, m);
                                m = m + 1;
                            end
                            l = l + 1;
                        end
                    end
                end
            else (bus_type_M(s) == 3);
             
                h = 3 * s - 2;
                for l = 1:1:3
                    g = 3 * s - 2;
                    for f1 = 1:1:3
                        YbusM(h, g) = Yat(l, f1);
                        g = g + 1;
                    end
                    h = h + 1;
                end
                for nb = 1:1:NBranch_M
                    if (line_start_bus_M(nb) == s || line_end_bus_M(nb) == s)
                        l = 1;
                        for k = 3 * s - 2:1:3 * s
                            m = 1;
                            for q = 3 * s - 2:1:3 * s
                                YbusM(k, q) = YbusM(k, q) + (1 / line_length_M(nb)) * Yb(l, m);
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
for s=1:1:N_M
    for j=1:1:N_M
        
    if (s ~= j)
        for nb = 1:1:NBranch_M
            if (line_start_bus_M(nb) == s & line_end_bus_M(nb) ==j||line_start_bus_M(nb) == j & line_end_bus_M(nb) ==s)
                l = 1;
%                 if i == 1
%                     disp(line_end_bus(nb))
%                 end
                for k = 3 * s - 2:1:3 * s
                    m = 1;
                    for q = 3 * j - 2:1:3 * j
                        YbusM(k, q) = YbusM(k, q) - (1 / line_length_M(nb)) * Yb(l, m);
                        m = m + 1;
                    end
                    l = l + 1;
                end
            end
        end
    end
    
    end
end
y_realM= real(YbusM);
y_imgM= imag(YbusM);